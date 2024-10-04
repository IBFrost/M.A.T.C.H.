from twitchio.ext import commands
import asyncio
import random
import requests
from config import *

DELAY = 30
MSGNAME = "Miyako-Twitch"
POW2 = [0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048]

DEFAULTHEADERS = {
    'Authorization': f'Bearer {TWITCH_IRC_TOKEN}',
    'Client-Id': TWITCH_CLIENT_ID,
    'Content-Type': 'application/json'
}

class MiyakoBotTwitch(commands.Bot):
    ACTIVEPREDICTION = False
    PREDICTIONSTRING = ''
    APEVENWINS = None
    APODDWINS = None
    LOOP = False

    def __init__(self, matchsys):
        super().__init__(token=TWITCH_IRC_TOKEN,
            client_id=TWITCH_CLIENT_ID,
            nick=TWITCH_NICK,
            prefix='#',
            initial_channels=[TWITCH_CHANNEL])   
        self.matchsys = matchsys
        self.message_queue = []

    def __consoleprint(self, msg):
        self.matchsys.console_print(MSGNAME, msg)
        
        
    def queue_message(self, message):
        self.message_queue.append(str(message))

    def prediction(self, action):
        active = self.ACTIVEPREDICTION
        if not active and not (action == 'start' or action == 'lock' or action == 'oddwins' or action == 'evenwins' or action == 'abort'):
            self.__consoleprint(f"Prediction called with invalid action. '{action}' is not a valid keyword")

        elif action == 'start':
            # Start a prediction
        
            
            data = {
                "title": "Will the winner be Even or Odd?",
                "outcomes": [
                    {"title": "Even", "color": "blue"},
                    {"title": "Odd", "color": "red"}
                ],
                "broadcaster_id": 1151683346,
                "prediction_window": 600,
                "status": "ACTIVE"
            }

            response = requests.post('https://api.twitch.tv/helix/predictions', headers=DEFAULTHEADERS, json=data)
            if response.status_code == 201:
                self.__consoleprint("Prediction started successfully!")
                self.ACTIVEPREDICTION = True 
                self.PREDICTIONSTRING = response.json()['data'][0]['id']  # Return the Prediction ID
                self.APEVENWINS = response.json()['data'][0]['outcomes'][0][id]
                self.APODDWINS = response.json()['data'][0]['outcomes'][1][id]
            else:
                self.__consoleprint(f'Error starting prediction:{response.json()}')

        elif not active:
            self.__consoleprint(f"Prediction modifier, '{action}', called with no active prediction")

        elif action == 'lock':
            data = {
                "status": "LOCKED"
            }
            response = requests.patch(f'https://api.twitch.tv/helix/predictions?id={self.PREDICTIONSTRING}', headers=DEFAULTHEADERS, json=data)
            if response.status_code == 204:
                self.__consoleprint("Prediction locked successfully!")
            else:
                self.__consoleprint(f'Error locking prediction:{response.json()}')
        
        elif action == 'evenwins':
            data = {
                "status": "RESOLVED",
                "winning_outcome_id": self.APEVENWINS  # Use the ID of the winning outcome
            }
            response = requests.patch(f'https://api.twitch.tv/helix/predictions?id={self.PREDICTIONSTRING}', headers=DEFAULTHEADERS, json=data)
            if response.status_code == 204:
                self.__consoleprint("Prediction result declared successfully!")
                self.ACTIVEPREDICTION = False
                self.PREDICTIONSTRING = ''
                self.APEVENWINS = None
                self.APODDWINS = None
            else:
                self.__consoleprint(f'Error declaring prediction result:{response.json()}')

        elif action == 'oddwins':
            data = {
                "status": "RESOLVED",
                "winning_outcome_id": self.APODDWINS  # Use the ID of the winning outcome
            }
            response = requests.patch(f'https://api.twitch.tv/helix/predictions?id={self.PREDICTIONSTRING}', headers=DEFAULTHEADERS, json=data)
            if response.status_code == 204:
                self.__consoleprint("Prediction result declared successfully!")
                self.ACTIVEPREDICTION = False
                self.PREDICTIONSTRING = ''
                self.APEVENWINS = None
                self.APODDWINS = None
            else:
                self.__consoleprint(f'Error declaring prediction result:{response.json()}')

        elif action == 'abort':
            # Stop a prediction
            data = {
                "status": "CANCELLED"
            }
            response = requests.patch(f'https://api.twitch.tv/helix/predictions?id={self.PREDICTIONSTRING}', headers=DEFAULTHEADERS, json=data)
            if response.status_code == 204:
                self.__consoleprint("Prediction stopped successfully!")
                self.ACTIVEPREDICTION = False
                self.PREDICTIONSTRING = ''
                self.APEVENWINS = None
                self.APODDWINS = None
            else:
                self.__consoleprint(f'Error stopping prediction:{response.json()}')
        
    def looping_tourney(self, divs):
        if self.matchsys.get_status() == IDLE:
            self.__consoleprint("Registering new tournament: " + str(divs))
            offset_change = self.matchsys.new_tournament(divs)
            i = 0
            while i < POW2[divs+1]:
                character = random.randint(0, self.matchsys.max_char_ID)
                ctable = []
                j = 1
                while j <= divs:
                    ctable.append(character)
                    j = j + 1
                player = self.matchsys.new_player(f"Player {i}", ctable)
                self.matchsys.add_player(player)
                i = i + 1  

    # Events don't need decorators when subclassed
    async def event_ready(self):
        self.__consoleprint(f'Ready | {self.nick}')
        delay = 0
        while(True):
            # Sleep for 10 seconds
            await asyncio.sleep(1)
            if delay == DELAY:
                delay = 0
            while self.message_queue:
                self.__consoleprint("Sending message.")
                await self.get_channel(TWITCH_CHANNEL).send(self.message_queue.pop(0))
                await asyncio.sleep(1)
            delay += 1


    async def event_message(self, message):
        """Message/Command handling. Most of the magic happens here"""
        if not message.author or (not message.author.is_broadcaster and not message.author.is_mod):
            return
        response = ""
        data = message.content.split(" ")
        command = data[0].strip().lower()

        if command == "!newtournament" or command == "!nt":
            if len(data) == 2:
                value = int(data[1])
                try:
                    assert value > 0
                except AssertionError:
                    # User gave a silly value for divisions...
                    response = "Number of divisions must be positive number"
                else:
                    if self.matchsys.get_status() == IDLE:
                        self.__consoleprint("Registering new tournament: " + str(value))
                        offset_change = self.matchsys.new_tournament(value)
            await message.channel.send(response)
            
        elif command == "!register" or command == "!r":
            if self.matchsys.get_status() == RUNNING:
                response = "Tournament has already started."
            elif self.matchsys.get_status() != REGISTRATION:
                response = "No tournament registration ongoing."
            else:
                try:
                    # Parse
                    chars = []
                    realchars = []
                    badchars = []
                    
                    # Check what registration contained
                    for i in data[1].split(",")[0:]:
                        value = self.matchsys.offset_char(int(i), True)
                        if int(i) < 0:
                            chars = []
                            response = "There ain't no contestants with negative numbers, sheesh..."
                            return
                        if int(i) > int(self.matchsys.get_max_ID()):
                            chars = []
                            await message.channel.send("Highest selectable id is " + self.matchsys.get_max_ID())
                            return
                        realchars.append(int(i))
                        chars.append(value)
                    if not self.matchsys.check_player(message.author.name and NO_DUPLICATES):
                        player = self.matchsys.new_player(message.author.name, chars)
                        # If everything is fine so far, do final checks and then create new player
                        if chars:
                            # Register characters first, if the registration fails. It matters not if these are there or not
                            badchars = self.matchsys.register_chars(realchars)
                            # Check if registration is accepted.
                        
                        # If character registration gave us badchars, tell to user
                        if badchars:
                            response = "Registration failed, following characters already taken: " + ','.join(str(i) for i in badchars)
                        else:
                            # Everything should be fine now, register
                            if self.matchsys.add_player(player):
                                register_message = message.author.name + " registered with characters: " + ','.join(str(i) for i in realchars)
                                self.matchsys.queue_register_message(register_message)
                            else:
                                # It failed...what gives?
                                # So either data was checked badly or registration closed
                                # Verify the name in registration, in case some trickery was involved, otherwise the registration closed
                                if self.matchsys.check_player(message.author.name) and NO_DUPLICATES:
                                    response = "Registration in your name already exists."
                                else:
                                    response = "Registration time has ended, sorry"
                    else:
                        response = "Registration in your name already exists."
                # Responses for bad values
                
                # Conversion to int failed, syntax error
                except ValueError:
                    response = "Correct syntax is 'register: <character id>, <character 2id>,...', dummy"
                # New player creation failed, incorrect number of divisions
                except IndexError:
                    response = "You need to give me exactly: " + str(self.matchsys.get_divisions()) + " characters. One for each division"
            if response:
                await message.channel.send(response)
        elif command == "!status" or command == "!s":
            status = self.matchsys.get_status()
            if status == IDLE:
                response = "Nothing happening, ready to go."
            elif status == REGISTRATION:
                response = "Registration open"
            elif status == RUNNING:
                response = "Running tournament"
            elif status == FINISHING:
                response = "Tournament ended"
            else:
                response = "Something is wrong"
            await message.channel.send(response)

        elif command == "!newbettournament" or command == "!nbt":
            if len(data) == 2:
                value = int(data[1])
                try:
                    assert value > 0
                except AssertionError:
                    # User gave a silly value for divisions...
                    response = "Number of divisions must be positive number"
                else:
                    if self.matchsys.get_status() == IDLE:
                        self.queue_message(f'Starting a new tournament with {value} divisions!')
                        self.__consoleprint("Registering new tournament: " + str(value))
                        offset_change = self.matchsys.new_tournament(value)
                        i = 0
                        while i < POW2[value+1]:
                            character = random.randint(0, self.matchsys.max_char_ID)
                            ctable = []
                            j = 1
                            while j <= value:
                                ctable.append(character)
                                j = j + 1
                            player = self.matchsys.new_player(f"Player {i}", ctable)
                            self.matchsys.add_player(player)
                            i = i + 1   
            elif len(data) == 3:
                value = int(data[1])
                loop = data[2]
                try:
                    assert value > 0
                except AssertionError:
                    # User gave a silly value for divisions...
                    response = "Number of divisions must be positive number"
                else:
                    try:
                        assert loop.lower() == 'true'
                    except:
                        response = "Second argument given was not 'true' | Remove the argument to start a single tournament or ensure it is 'true' to begin a looped one"
                    else:
                        if self.matchsys.get_status() == IDLE:
                            self.matchsys.begin_loop(value)
                            self.queue_message(f'Starting a new tournament with {value} divisions!')
                            self.__consoleprint("Registering new tournament: " + str(value))
                            offset_change = self.matchsys.new_tournament(value)
                            i = 0
                            while i < POW2[value+1]:
                                character = random.randint(0, self.matchsys.max_char_ID)
                                ctable = []
                                j = 1
                                while j <= value:
                                    ctable.append(character)
                                    j = j + 1
                                player = self.matchsys.new_player(f"Player {i}", ctable)
                                self.matchsys.add_player(player)
                                i = i + 1

                        
            await message.channel.send(response)
        #await self.handle_commands(message)
