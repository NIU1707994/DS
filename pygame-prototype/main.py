import pygame
from bird import Bird
from cloud import Cloud
from factorySprites import FactorySprites
from game import Game
from screen import Screen

# Initialize PyGame
# setup for sounds_music, defaults are good
pygame.mixer.init()
pygame.init()
# create the screen object
pygame.display.set_mode((Screen.width, Screen.height))
level = 'easy'

if level=='easy':
    factory_flying = FactorySprites([Bird()], [300], pygame.USEREVENT + 1)
    factory_landscape = FactorySprites([Cloud()], [400], pygame.USEREVENT + 10)
    

# play
game = Game(factory_flying, factory_landscape)
game.play()