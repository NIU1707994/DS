import json as js

class SavePunctuation:
    PATH = 'leader_board.json'
    MAX_ENTRIES = 5

    def __init__(self):
        try:
            with open(self.PATH, 'r') as file:
                self._data = js.load(file)
        except (FileNotFoundError, js.JSONDecodeError):
            self._data = {}

    def save(self, player, punctuation):    
        if len(self._data) <= self.MAX_ENTRIES:
            self._data[player] = punctuation

            with open(self.PATH, 'w') as file:
                js.dump(self._data, file)
        