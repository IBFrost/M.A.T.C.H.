import threading
import time
import tournament as tournament
import random
import mugenoperator as mo
import asyncio
import filewriter

from config import *

if (USE_DISCORD):
    import miyako_discord
    from discord.ext import commands
if (USE_TWITCH):
    import miyako_twitch

MSGNAME = "M.A.T.C.H."

# Console structure:

CONSOLE_STRUCTURE  = "\n\n\n"
CONSOLE_STRUCTURE += "Operator console\n"
CONSOLE_STRUCTURE += "----------------\n"
CONSOLE_STRUCTURE += "Command options:\n"
CONSOLE_STRUCTURE += "  1. Force tournament start\n"
CONSOLE_STRUCTURE += "  2. Reset registration\n"
CONSOLE_STRUCTURE += "  3. Halt tournament\n"
CONSOLE_STRUCTURE += "  4. Halt tournament and restart Mugen\n"
CONSOLE_STRUCTURE += "  5. Restart mugen\n"
CONSOLE_STRUCTURE += "Type option number and press enter to execute.\n"
CONSOLE_STRUCTURE += "Empty or invalid option closes console.\n"


class match_system():
    def __init__(self):
        self.state = IDLE
        self.timers = False
        self.status = ""
        self.__timer_count = TIMER_INTERVALS[0]
        self.console_locked = 0
        
        self.mugen = ""
        self.max_char_ID = 0
        
        self.reserved_characters = []
        self.players = []
        self.divisions = 0
        self.current_division = 1
        self.last_division = 0
        self.offset = 0
        self.offset_counter = OFFSET_COUNT
        self.lock = threading.Lock()
        
        self.toursys = ""
        self.register_messages = []
        self.division_complete = False
        
        self.filewriter = filewriter.FileWriter()
        self.filewriter.deamon = True
        
        self.scoreboard = self.__read_scorefile(SCOREFILE)
        self.ds_client = ""
        self.twch_client = ""
        self.winner = 999
        
        
        
    def __init_mugen(self):
        self.mugen = mo.MugenOperator(self)
        self.max_char_ID = self.mugen.get_max_ID()


        
    # Function to check if mugen is still running

    def check_mugen(self):
        if self.mugen.are_you_still_there():
            if self.state == ERROR:
                self.lock.acquire()
                self.state = IDLE
                self.lock.release()
                # Some kind of message needs to be sent.
        else:
            self.lock.acquire()
            self.state = ERROR
            self.lock.release()
            
            self.mugen.reset(True)


    def check_mugen_loaded(self):
        state = self.mugen.get_state()
        return not (state == mo.LOADING_STATE or state == mo.DEAD_STATE)



    
    def console_print(self, sender, message):
        """Function to control console printouts. Decorates messages with sender"""
        
        if not self.console_locked:
            print(str(sender) + ": " + str(message))


    def update_html_content(self, text, time):
        """Update/create HTML file.
        Text is the content, time is the automatic refresh time for the page
        Idea here is that the page can be empty with minimal refresh time making it responsive to updates
        When needed, the content can be updated and shown for refresh time.
        """
        
        html = f'<head><meta http-equiv="refresh" content={time}>'
        html += f'<link rel="stylesheet" type="text/css" href="style.css">'
        html += f'</head><body>'
        
        endline = True
        for char in text:
            if char == '\n':
                html += "<br>"
                endline = True
            elif char == " " and endline:
                html +="&nbsp;"
            else:
                endline = False
                html += char
        
        html +='</body>'
        
        self.filewriter.queue(html, 0, RESULTS_HTML)
            
            
    def output_results(self, results_dict, title, time):
        if USE_HTML:
            self.show_html_results(results_dict, title, time)
        else:
            #just write file
            scores = ""
            for i in range(TOP_PADDING):
                scores += "\n"
            scores += f"\n{'':{TITLE_LEFT_PADDING}}{title}\n\n"
            for i in range(WIDTH):
                scores += "-"
            scores += "\n"
            scores += self.__create_scoretable(results_dict)
            self.filewriter.queue(scores, RESULT_TIME_DIVISION, RESULTS_TXT)
 
    
    ########################
    # SCOREBOARD FUNCTIONS #
    ########################



    def __write_scorefile(self, data, file):
        '''Write scoreboard to file'''
        
        f = open(file, "wt")
        for key in iter(data):
            f.write(key + "," + str(data[key]) + ",\n")
        f.close()



    def __read_scorefile(self, file):
        '''Read scoreboard from file'''
        
        try:
            f = open(file, "r")
            data = {}
            for line in f:
                tmp = line.split(",")[:2]
                data[tmp[0]] = int(tmp[1])
            f.close() 
        except FileNotFoundError:
            # The scorefile has been cleared
            return {}
        return data



    def __update_scoreboard(self, players):
        '''Adds current scores to the scoreboard'''
        
        for player in players:
            score = 0
            for rank in player["Rank"]:
               score += rank
            if player["Name"] in self.scoreboard:
                self.scoreboard[player["Name"]] += score 
            else:
                self.scoreboard[player["Name"]] = score



    def __create_scoretable(self, dict):
        ''' Generates HTML table with scores from dictionary {"Name": score}'''
        
        scoretable = ""
        rankings = [k for k in sorted(dict.items(), key=lambda item: item[1], reverse=True)]
        # Limit the table size to RANKING_LIST_MAX
        size = 0
        for i, player in enumerate(rankings):
            if i > RANKING_LIST_MAX:
                break
            scoretable += f"{'':{LEFT_PADDING}}{(i + 1):{RANK_SPACES}}. {player[0]:{NAME_SPACES}} {player[1]:{POINTS_SPACES}}{'':4}\n"
            size = i
        # Add padding to text to keep the number of rows constant
        while(size < RANKING_LIST_MAX + BOTTOM_PADDING):
            scoretable += "\n"
            size += 1
        return scoretable

        

    def __create_html_scoretable(self, dict):
        '''Generates HTML table with scores from dictionary {"Name": score}'''
        
        table = "<table>"
        rankings = [k for k in sorted(dict.items(), key=lambda item: item[1], reverse=True)]
        # Limit the table size to RANKING_LIST_MAX
        for i, player in enumerate(rankings):
            if i > RANKING_LIST_MAX:
                break
            table += f"<tr><td>{i}</td><td>{player[0]}</td><td>{player[1]}</td></tr>"
        table += "</table>"
        return table


    
    def show_html_results(self, results_dict, title, display_time):
        '''
        Create results HTML for the finished division. Display the page for HOLDTIME_SHORT.
        '''
        
        # Right, time to create and show the results with some HTML trickery
        # First create the page structure. Put the content in div to enable different style
        
        results_html = "<div><h3>{title}</h3>" 
        results_html += "\n--------------\n"
        results_html += self.__create_html_scoretable(results_dict) + "</div>"
        
        # Update page with results and automatic refresh of short holdtime
        self.update_html_content(results_html, RESULTS_HTML, display_time)
        # Wait few seconds for the page to update
        time.sleep(3)
        # Write empty page with auto refresh of 1 second. This will be shown after the auto-refresh of the first update is reached
        self.update_html_content("", "results.html", 1)

        # Wait for the rest of the results holdtime.
        if display_time > 2:
            time.sleep(display_time - 2)

    ##################
    #     TIMERS     #
    ##################


    def __start_timers(self):
        self.timers = True
        
    def __reset_timers(self):
        self.__timer_count = TIMER_INTERVALS[0]
        self.timers = False
        
    def __timers_active(self):
        return self.timers

    def time_warning(self, i):
        return str(i) + " seconds to tournament start."



    #################################
    #     TOURNAMENT FUNCTIONS      #
    #################################


    def queue_register_message(self, message):
        if message:
            self.register_messages.append(str(message))


    def get_status(self):
        return self.state


    def get_divisions(self):
        return self.divisions


    
    def check_player(self, name):
        '''Check if player is already registered'''
        
        if NO_DUPLICATES:
            for player in self.players:
                if player["Name"] == name:
                    return True
        return False
        

                

    def register_chars(self, chars):
        '''Register characters, return list of characters that failed
        Return empty list if success
        '''
        
        badchars = []
        self.lock.acquire()
        if self.state != REGISTRATION:
            self.lock.release()
            return badchars
        #for char in chars:
            #if chars.count(char) > 1:
                #badchars.append(char)
            #elif char in self.reserved_characters:
                #badchars.append(char)
        if not badchars:
            self.reserved_characters += chars
        self.lock.release()
        return badchars



    
    def unregister_chars(self, chars):
        '''Remove given characters that have been previously selected'''
        
        self.lock.acquire()
        for char in chars:
            if char in self.reserved_characters:
                reserved_characters.remove(char)
        self.lock.release()




    def add_player(self, player):
        '''Add new player, check for duplicate'''
        
        self.lock.acquire()
        # Ensure that state has not been changed by other threads
        if self.get_status() != REGISTRATION:
            self.lock.release()
            return False
        
        # Are duplicate entries unacceptable?
        if (NO_DUPLICATES):
            if self.check_player(player["Name"]):
                self.lock.release()
                return False    
        self.players.append(player)
        if len(self.players) > 1:
            self.__start_timers()
        self.lock.release()
        self.console_print(MSGNAME,"Added : " + str(player))
        return True




    def new_player(self, name, chars):
        '''Create new player with characters chars, raise IndexError if any character is reserved 
        PLAYER data contains: 
        User name, Achieved rank in each division, Character id's for Each division
        player == {"Name" : "Example", "Rank" : [0,0,0], "Characters" : [1,2,3]}
        '''
        
        #if not len(chars) == self.divisions:
            #raise IndexError('Character mismatch')
            #return {}
        return {"Name":name, "Rank": [0 for i in range(self.divisions)], "Characters": chars}
        


    ##################################
    #        TOURNAMENT LOGIC        #
    ##################################
        
    
    def new_tournament(self, divisions):
        '''Create new tournament, this will clear any previous tournament data'''
        
        # Lock tournament data
        self.lock.acquire()
        # Check that the situation has not been changed by other threads
        if self.get_status() != IDLE:
            self.lock.release()
            return False
        
        # No tournament is running
        
        # This should be checked before entering new tournament.
        # This function will simply return false.
        if divisions < 1:
            self.lock.release()
            return False
        
        # Reset old tournament, start new
        self.current_division = 1
        self.last_division = 0
        self.division_complete = False
        self.players = []
        self.divisions = divisions
        self.reserved_characters = []
        self.state = REGISTRATION
        
        # Check if offset needs renewing
        if self.offset_counter >= OFFSET_COUNT:
            self.offset = random.randint(0, self.max_char_ID)
            self.offset_counter = 0
        else:
            self.offset_counter += 1
        self.lock.release()
        return True
    
    def division_update(self, division, finished):
        '''Used to update the division status for the MATCH. 
        Coordinates the results printing and division tracking 
        '''
        if finished:
            self.division_complete = True
            self.last_division = division
        else:
            self.current_division == division
            

    def tournament_update(self):
        '''Get the current tournament status from the tournament subsystem and updates the info text accordingly.
        Returns a presence that can be forwarded to discord
        '''
    
        if self.get_status() == RUNNING:
            state_round = self.toursys.get_state("Round")
            state_div = self.toursys.get_state("Div")
            fight = self.toursys.get_state("Fight")
            if fight:
                state_fight =  f"{fight[0][0]} ({self.offset_char(fight[0][1], False)}) VS " 
                state_fight += f"{fight[1][0]} ({self.offset_char(fight[1][1], False)})"
                self.filewriter.queue(f"Current match: {state_fight}", 0, INFO_TXT)
            else:
                state_fight = "-"
            new_presence = "Running tournament. Match: {state_fight}0 -- Division: {(state_div + 1)} Round : {state_round})"

        else:
            if self.get_status() == IDLE:
                new_presence = "Idle"
            elif self.get_status() == REGISTRATION:
                new_presence = "Registration open for {self.divisions} division tournament. Current entries: {len(self.players)}"
            elif self.get_status == RESET:
                new_presence = "Match reset...stand by"
            else:
                new_presence = "Tournament ended"
        return new_presence



    def run_tournament(self):
        '''Create tournament thread and run tournament'''
        self.finalresult = 999
        # Create new tournament thread
        tour_t = threading.Thread(target=self.toursys.run_tournament , args=(self.players, self.divisions, self.mugen))
        
        self.console_print(MSGNAME,"Tournament controller started")
        tour_t.start()
    
        # Kickoff tournament
        if (USE_DISCORD):
            self.ds_client.queue_pic(TOURNAMENT_START_PIC, "Tournament started, finally we get the good bit")
        if (USE_TWITCH):
            self.twch_client.prediction('lock')
    
        # While in tournament, suspend other activity
        if self.toursys.is_running():
            timer = 0
            while self.toursys.is_running():
                # Check status
                status = self.tournament_update()
                # Send new presence data to Discord bot and update info texts
                if (USE_DISCORD):
                    if timer % 5 == 0:
                        self.ds_client.set_presence(status)   
                
                # Check if we need to deliver division results
                if self.division_complete:
                    self.division_complete = False
                    
                    results, results_dict = self.toursys.rankings(self.players, self.last_division)
                    
                    text = f"Division {self.last_division}"
                    if (USE_DISCORD):
                        # Send update to Discord
                        self.ds_client.queue_message(f"{text} finished." )
                    
                    # Show division results HTML
                    self.finalresult = self.toursys.get_winner()
                    self.output_results(results_dict, f"{text} results.", RESULT_TIME_DIVISION)
                        
                # Timer reset
                if status != self.status:
                    self.status = status
                    timer = 0
                
                # Recovery timer check
                if timer > RECOVERY_TIME:
                    # Mugen is probably stuck.
                    self.lock.acquire()
                    self.state = RESET
                    self.lock.release()
                    
                    self.mugen.reset(True)
                    timer = 0
                
                
                time.sleep(1)
                if self.check_mugen_loaded():
                    if self.state == RESET:
                        self.lock.acquire()
                        self.state = RUNNING
                        self.lock.release()
                    timer += 1
        return self.finalresult



    def stop_tournament_registration(self):
    
        # Stop only if in registration or timers are running
        if not (self.state == REGISTRATION or self.__timers_active()):
            return "No tournament registration ongoing"
        else:
            self.lock.acquire()
            self.state = IDLE
            self.__reset_timers()
            self.lock.release()
            self.console_print(MSGNAME, "Registration cancelled.")
            
            
            if (USE_DISCORD):
                self.ds_client.queue_message("Tournament registration aborted by operator")
            if (USE_TWITCH):
                self.twch_client.prediction('abort')
            return ""
            

    def stop_tournament(self, kill):
        if self.state == IDLE or self.state == REGISTRATION:
            return "No tournament is running at the moment"
        else:
            self.lock.acquire()
            self.toursys.stop_tournament()
            self.state = IDLE
            self.lock.release()
            self.console_print(MSGNAME, "Tournament stopped.")
            if (USE_DISCORD):
                self.ds_client.queue_message("Ongoing tournament stopped by operator")
            if (USE_TWITCH):
                self.twch_client.queue_message("Ongoing tournament stopped by operator")
                self.twch_client.prediction('abort')

            # Kill mugen process as well, if requested.
            self.mugen.reset(kill)            
            return ""

    ############################
    #      OFFSET SYSTEM       #
    ############################
    
    
    def offset_changed(self):
        return self.offset_counter == 0


    def get_offset_duration(self):
        return str(OFFSET_COUNT - self.offset_counter)


    # Apply current offset
    def offset_char(self, value, add):
        if add:
            tmp = value + self.offset
        else:
            tmp = value - self.offset
        return tmp % (self.max_char_ID + 1)


    def get_max_ID(self):
        return str(self.max_char_ID)



    ######################################################
    #         MAIN LOGIC, THREADS & ASYNCIO LOOP         #
    ######################################################
    
    def main(self):
        
        print(MSGNAME + " starting up...\n")
        print("Operator console can be accessed by pressing enter.")
        print("--------------------------------------------------------------\n\n")
        
        time.sleep(3)
        # Start mugen and init mugenoperator
        self.__init_mugen()
         
        # Init bots
        if (USE_DISCORD):
            bot = commands.Bot(command_prefix="!")
            self.ds_client = miyako_discord.MiyakoBotDiscord(bot, self)
            bot.add_cog(self.ds_client)
        if (USE_TWITCH):
            self.twch_client = miyako_twitch.MiyakoBotTwitch(self)
        
        # Start the filewriter        
        self.filewriter.start()

        # Create and start main loop
        main_thread = threading.Thread(target=self.main_loop, args=())
        main_thread.start()
        
        # Create thread for interactions
        interaction_thread = threading.Thread(target=self.operator_loop, args=())
        interaction_thread.daemon = True
        interaction_thread.start()
        
        
        loop = asyncio.get_event_loop()
        if (USE_DISCORD):
            loop.create_task(bot.start(DISCORD_TOKEN))
        if (USE_TWITCH):
            loop.create_task(self.twch_client.run())
        if (USE_TWITCH or USE_DISCORD):
            loop.run_forever()
    
    

    
    def main_loop(self):
        '''Main program logic. 
        In short:
        1. Idle state/Registration/Timers
        2. Tournament start
        3. Tournament loop
          - Display results when needed
        4. Watchdog
        '''
    
        # INIT
        self.toursys = tournament.Tournament(self)
        system_timer = 1
        
        # Reset the HTML outputs to empty content and 1 second refresh
        
        if USE_HTML:
            self.update_html_content("", 1)
        else:
            self.filewriter.queue("", 0, RESULTS_TXT)
        self.filewriter.queue("", 0, INFO_TXT)
        previous_state = self.get_status()
        
        
        # LOOP
        while(1):
            # IDLE/REGISTRATION START
             
            # Check for status change
            if previous_state != self.get_status():
                previous_state = self.get_status()
                
                # Registration started, update files & clients
                if self.get_status() == REGISTRATION:
                    self.twch_client.prediction('start')
                    self.filewriter.queue("Registration in progress", 0, INFO_TXT)                    
                    # Send message to clients. Twitch is needs the message in two parts
                    message = f"Registration is now open for tournament with {self.divisions} divisions.\nCharacter ID's 0-{self.get_max_ID()} are accepted.\n"
                    ds_message = "" + message
                    #if (USE_TWITCH):
                        # Send part 1 to Twitch
                        #self.twch_client.queue_message(message)
                    
                    # Prepare the second part
                    message = ""
                    if self.offset_counter == 0:
                        message += "New character offset was created.\n"
                    message += "Current character offset will be used for " + self.get_offset_duration() + " matches.\n"
                    #if (USE_TWITCH):
                        # Send part 2 to Twitch
                        #self.twch_client.queue_message(message)

                    #if (USE_DISCORD):
                        # Send both parts to Discord in one message
                        #self.ds_client.queue_message(ds_message + message)
         
         
            #if (USE_DISCORD):
                # Update the discord presence every 5 seconds
                #if system_timer % 5 == 0:
                    #self.ds_client.set_presence(self.tournament_update())
                
            # If any queued registrations exists, send them to all clients
            #while self.register_messages:
                #msg = self.register_messages.pop(0)
                #if (USE_DISCORD):
                    #self.ds_client.queue_message(msg)
                #if (USE_TWITCH):
                    #self.twch_client.queue_message(msg)

            # Timed message system
            if self.__timers_active():
                for interval in TIMER_INTERVALS:
                    if self.__timer_count == interval:
                        #if (USE_DISCORD):
                            #self.ds_client.queue_message(self.time_warning(interval))
                        #if (USE_TWITCH):
                            #self.twch_client.queue_message(self.time_warning(interval))
                        self.filewriter.queue(f"Registration in progress. Tournament starting in {interval}", 0, "info.txt")
                self.__timer_count -= 1

            
            # IDLE/REGISTRATION END

            # TOURNAMENT START AND RUNNING
            
            # Print status then check if timers & tournaments need running
            if not self.toursys.is_running() and self.__timers_active() and self.__timer_count <= 0:
                # Countdown complete, reset
                self.lock.acquire()
                self.state = RUNNING
                self.lock.release()
                self.__reset_timers()
                
                # Run tournament
                winner = self.run_tournament()
                self.console_print(MSGNAME, winner)
                if winner % 2 == 0:
                    self.twch_client.prediction('evenwins')
                else:
                    self.twch_client.prediction('oddwins')
                # Check if the toursys was killed by operator. Specifically that state is still RUNNING
                if self.state == RUNNING:
                
                    # TOURNAMENT END
                    
                    # Change state to finishing up
                    self.lock.acquire()
                    self.state = FINISHING
                    self.lock.release()
                    
                    # RESULTS
                    
                    # Clear the info text
                    self.filewriter.queue("", 0, INFO_TXT)
                    
                    #if (USE_DISCORD):
                        # Update Discord presence and show division results:
                        #self.ds_client.set_presence(self.tournament_update())
                    results, results_dict = self.toursys.rankings(self.players, self.last_division)
                    
                    # Send update to Discord
                    #if (USE_DISCORD):
                        #self.ds_client.queue_message(f"Division: {self.last_division} finished." )
                    
                    # Output division results to file
                    title = f"Division {self.last_division} results."
                    self.output_results(results_dict, title, RESULT_TIME_DIVISION)
                    
                    
                    self.console_print(MSGNAME,"Showing results")
                    
                    # Send tournament end messages
                    if (USE_TWITCH):
                        self.twch_client.queue_message("Tournament finished.")
                    #if (USE_DISCORD):
                        #self.ds_client.queue_pic(PICS[random.randint(0,len(PICS) - 1)], "Ah that was nice.")
                    # Create results
                    results, results_dict = self.toursys.final_rankings(self.players, self.divisions)
                    
                    #if (USE_DISCORD):
                        #self.ds_client.queue_message(results)
                    
                    # Add scores to highscores and write new scorefile
                    self.__update_scoreboard(self.players)
                    self.__write_scorefile(self.scoreboard, SCOREFILE)
                    
                    # Change state to idle before all time scores.
                    self.lock.acquire()
                    self.state = IDLE
                    self.lock.release()
                    
                    # Update the results.html with results then highscores. 
                    # Hold data for RESULT_TIME_FINAL for both, then clear
                    
                    title = "Final tournament scores:"
                    self.output_results(results_dict, title, RESULT_TIME_DIVISION)
                    
                    # Meanwhile, create HTML table for highscores
                    title = "All time scores:"
                    self.output_results(self.scoreboard, title, RESULT_TIME_DIVISION)
                    
                    # Reset the previous state, in case someone tries to register before idle loop executes 
                    previous_state = ""
                

            # Watchdog system                    
            # Print system status every DELAY seconds
            
            if system_timer > WATCHDOG_DELAY:
                self.check_mugen()
                if self.get_status() == IDLE:
                    status = "Ready - Waiting commands"
                elif self.get_status() == REGISTRATION:
                    status = "Registration ongoing"
                elif self.get_status() == RUNNING:
                    status = "Tournament running"
                elif self.get_status() == FINISHING:
                    status = "Tournament ended, displaying results"
                else:
                    status = "Mugen failure, trying to recover"
                self.console_print(MSGNAME,status)
                system_timer = 0
            system_timer += 1                
            
            # Wait for one second on each cycle of main loop
            time.sleep(1)    
            
            # End of the main loop. 


    ################################
    #  Operator console system     #
    ################################



        
    def operator_loop(self):
        '''Loop for operator console'''
        
        while(True):
            input()
            
            # Suppress other console messages
            self.console_locked = 1
            
            print(CONSOLE_STRUCTURE)
            selection = input(">>")
            
            if selection == "1":
                self.force_tournament_start()
            elif selection == "2":
                self.op_registration_reset()
            elif selection == "3":
                self.op_tournament_reset()
            elif selection == "4":
                self.op_tournament_hard_reset()
            elif selection == "5":
                self.op_mugen_reset()
            else: 
                print("\n\n")
                # Completed, free console
                self.console_locked = 0
    
    def op_registration_reset(self):
        if self.op_confirm("This will stop the current registration and system returns to ready state"):
            print("Clearing registration...\n")
            
            self.console_locked = 0
            print(self.stop_tournament_registration())
    

    def force_tournament_start(self):
        if self.get_status() != REGISTRATION:
            print("Registration not running.\n\n")
            return False
        if len(self.players) < 2 :
            print("Too few registrations. Unable to force start.\n\n")
            return False
        if self.op_confirm(f"This will start the tournament with {len(self.players)} players."):
            print("Force starting tournament\n")
            
            self.console_locked = 0
            self.__timer_count = 1
            return True
    
        
    def op_tournament_reset(self):
        if self.op_confirm("Current running tournament will be stopped.\nResults data will be lost and system returns to ready state"):
            print("Tournament reset in progress...\n")
            self.console_locked = 0
            print(self.stop_tournament(False))
    
    def op_tournament_hard_reset(self):
        if self.op_confirm("Current running tournament and Mugen will be stopped.\nResults data will be lost and system returns to ready state"):
            print("Tournament and Mugen reset in progress...\n")
            self.console_locked = 0
            print(self.stop_tournament(True))
    
        
    def op_mugen_reset(self):
        if self.op_confirm("Current Mugen process will be killed and restarted."):
            print("Executing mugen restart...\n")
            self.console_locked = 0
            self.mugen.reset(True)

    def op_confirm(self, msg):
        print(msg)
        confirm = input("Are you sure? (Y/N)\n>>")
        if confirm == "y" or confirm == "Y":
            return True
        else:
            print("Action cancelled")
            return False

    def define_winner(self, number):
        self.winner = number

def main():   
    matchsys = match_system()
    matchsys.main() 
    
if __name__ == "__main__":
    main()
