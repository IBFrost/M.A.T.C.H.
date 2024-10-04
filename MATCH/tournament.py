import random
import math
import time
import mugenoperator as mo
from config import *



WINNER1 = 1
WINNER2 = 2
POW2 = [0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048]
MAX_ROUNDS = 32 # Maximum number of tournament rounds. 32 is massive tournament
MSGNAME = "Tournament control"

ONGOING = False
FINISHED = True


class Tournament:
    def __init__(self, matchsys):
        self.running = 0
        self.tournament_state = {"Div": 0, "Round": 1, "Match": 1, "Fight": [], "Order" : []}
        self.matchsys = matchsys
        self.winningplayer = ""



    def __consoleprint(self, msg):
        self.matchsys.console_print(MSGNAME, msg)

    def is_running(self):
        return self.running

    
    def stop_tournament(self):
        self.running = 0
    
    # Update the state of the running tournament
    def __update_tournament_state(self, id, value):
        try:
            if self.running:
                self.tournament_state[id] = value
        except KeyError:
            self.__consoleprint("State update failed, incorrect key")
            
    def get_state(self, id):
        try:
            if self.running:
                return self.tournament_state[id]
        except KeyError:
            self.__consoleprint("State error, incorrect key")



    # Prints out the ranking of the given division
    def rankings(self, players, division, twitchbot):
        if (division - 1) < 0:
            return "Error", {}
        division -= 1
        
        self.__consoleprint(f"Rankings being generated for: {division + 1}")
        score_dict = {}

        

        count = MAX_ROUNDS

        position = 1
        message = ("---------\n")
        message += (f"Division {division + 1} finished!\n")
        message += ("Rankings:\n---------\n")
        #twitchbot.queue_message(f"Division {division + 1} finished!")
        #twitchbot.queue_message("Rankings:")
        while(count):
            for player in players:
                score_dict[player["Name"]] = player["Rank"][division]
                if player["Rank"][division] == count:
                    message += f"{position:2}. {player['Name']:20} Tournament round {player['Rank'][division]}\n"
                    #twitchbot.queue_message(f"{position:2}. {player['Name']:20} Tournament round {player['Rank'][division]}")
                    position += 1
            count -= 1
        return message, score_dict



    def final_rankings(self, players, divisions, twitchbot):
        score = []
        score_dict = {}
        self.__consoleprint("Final rankings")

        highest_score = -1  # Initialize to a low number to find the max
        highest_scoring_player = None  # To store the name of the highest scoring player
        
        for idx, player in enumerate(players):
            score.append(0)
            name = player["Name"]
            score_dict[name] = 0
            for i in range(divisions):
                score[idx] += player["Rank"][i]
            score_dict[name] = score[idx]
            
            if score[idx] > highest_score:
                highest_score = score[idx]
                highest_scoring_player = name

        count = 10 * divisions
        position = 1
        message = "FINAL STANDINGS:\n----------------\n"
        twitchbot.queue_message("FINAL STANDINGS:")
        
        #self.winningplayer = int(highest_scoring_player.split()[1])
        self.winningplayer = int(highest_scoring_player.split()[1])
        
        if self.winningplayer % 2 == 0:
            #twitchbot.queue_message('LEFT WON!')
            self.__consoleprint('even won')
            twitchbot.prediction('evenwins')
        else:
            twitchbot.prediction('oddwins')
            self.__consoleprint('odd won')

        while(count):
            for i, player in enumerate(players):
                if score[i] == count:
                    rank = [str(x) for x in player["Rank"]]
                    message += f"{position:2}. {player['Name']:20} Total score: {score[i]}\n"
                    twitchbot.queue_message(f"{position:2}. {player['Name']:20} Total score: {score[i]}")
                    position += 1
                count -= 1
        twitchbot.queue_message(f'{highest_scoring_player} WON THE TOURNAMENT!')
        return message, score_dict



    def player_order(self, order):
        message = "Player order for next round:"
        for i in order:
            message += self.players[i]["Name"] + "\n"
        return message



    def run_tournament(self, players, divisions, mugen):
        self.running = 1
        self.__consoleprint("Starting")
        self.__update_tournament_state("Div", 0)
        self.__update_tournament_state("Round", 1)
        self.__update_tournament_state("Match", 1)
        self.__update_tournament_state("Fight", "")
        self.__update_tournament_state("Order", [])
        
        for i in range(divisions):
            if not self.is_running():
                break
            # Update state
            self.__update_tournament_state("Div", i)
            
            # Play division i
            if i != 0:
                time.sleep(RESULT_TIME_DIVISION)
            ranking = self.play_division(players, i, mugen)

        if not self.is_running():
            self.__consoleprint("Tournament aborted")
            return
        
        self.__update_tournament_state("Div", divisions + 1)
        self.running = 0
        self.__consoleprint("finished tournament")


        
    # Play match function currently simulates a battle for the tournament system
    # This should be implemented by game control side of things.
    
    def play_match(self, player1, player2, division, mugen):
        self.__update_tournament_state("Fight", [[player1["Name"], player1["Characters"][division]],[player2["Name"], player2["Characters"][division]]])
        
        winner = -1
        
        while(winner == -1):
            if not self.is_running():
                break
            mugen.scan()
            time.sleep(0.5)
            mugen.scan()
            time.sleep(0.5)
            self.__consoleprint("Checking Mugen state")
            if mugen.get_state() == mo.DEAD_STATE:
                self.__consoleprint(" ...Mugen was dead from the get go, waiting for reset")
                mugen.reset(True)
                time.sleep(10)
                mugen.scan()
            if mugen.get_state() == mo.LOADING_STATE:
                self.__consoleprint(" ...Mugen is still loading")
                time.sleep(5)
                mugen.scan()
            else:
                if mugen.get_state() == mo.MENU_STATE:
                    self.__consoleprint(" ...Mugen in main menu")
                    mugen.scan()
                if mugen.get_state() == mo.SELECT_STATE:
                    self.__consoleprint(" ...Mugen in select screen")
                    #while mugen.get_queue_size(mo.PLAYER1) != 0 and mugen.get_queue_size(mo.PLAYER2) != 0:
                    #    mugen.scan()
                    
                    self.__consoleprint("Inserting characters")
                    self.__consoleprint(f"  ...Player 1: {player1['Characters'][division]}")
                    mugen.add_character(player1["Characters"][division], mo.PLAYER1)
                    
                    self.__consoleprint(f"  ...Player 2: {player2['Characters'][division]}")
                    mugen.add_character(player2["Characters"][division], mo.PLAYER2)

                    # Command operator to insert characters
                    mugen.scan()

                    # Wait through the character selection and vs screens
                    while (mugen.get_state() == mo.VS_STATE):
                        time.sleep(5)
                        mugen.scan()

                    # Wait until fight is finished. This will also fail if Mugen is dead
                    self.__consoleprint("Match started, waiting for result")
                    while(mugen.get_state() == mo.FIGHT_STATE):
                        winner = mugen.scan()
                        if(winner != -1):
                            break
                        time.sleep(2)
                    if winner != -1:
                        self.__consoleprint("Match finished")
                    elif not self.is_running():
                        self.__consoleprint("Match aborted by operator")
                    else:
                        self.__consoleprint("Match inconclusive. Re-Match")
        return winner
        

        
    def play_division(self, players, division, mugen):
        
        # Calculate the rounds needed based on finding the power of two bigger than and closest to number of players
        for r in range(len(POW2)):
            if POW2[r] >= len(players):
                rounds = r
                break
            
        order = [i for i in range(len(players))]
        random.shuffle(order)
        ranking = []
        
        #Preliminaries done, update system and start playing
        self.__consoleprint(f"Starting division {division + 1}")
        self.matchsys.division_update(division + 1, ONGOING)
        
        #Play division
        while(order):
        
            # Play each round
            for round in range(1, rounds, 1):
                self.__update_tournament_state("Round", round)
                self.__update_tournament_state("Order", order)
                self.__consoleprint(f"Division round : {round}")
                # Reverse order every tound to balance the tournament with odd number of players
                order.reverse()
                
                match = 0
                while(len(order) - 1 > match):
                    time.sleep(0.5)
                    self.__consoleprint(f"Division match : {match + 1}")
                    if len(order) - match > 1:
                        result = self.play_match(players[order[match]], players[order[match + 1]], division, mugen)
                        if result == -1 and not self.is_running():
                            return
                        self.__consoleprint(f"Match result: {result}.")
                        if result == WINNER1:
                            # Player 2 lost, mark the achieved rank in division to player rank data
                            players[order[match + 1]]["Rank"][division] = round
                            ranking.insert(0,order.pop(match + 1))
                            
                        if result == WINNER2:
                            # Player 1 lost, mark the achieved rank in division to player rank data
                            players[order[match]]["Rank"][division] = round
                            ranking.insert(0,order.pop(match))
                    match += 1
                    
                if len(order) == 1: 
                    self.__consoleprint(f"Division complete, winner was: {players[order[0]]['Name']}")
                    # We have a winner
                    players[order[0]]["Rank"][division] = round + 1
                    ranking.insert(0,order.pop(0))
        
        # Finished, update match division data.
        self.matchsys.division_update(division + 1, FINISHED)
        return ranking
    