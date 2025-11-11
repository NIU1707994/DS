import pygame
from bird import Bird
from cloud import Cloud
from factorySprites import FactorySprites
from game import Game
from screen import Screen
from umbrella import Umbrella
from mountain import Mountain
from jet import Jet
from missile import Missile
# Initialize PyGame
# setup for sounds_music, defaults are good
pygame.mixer.init()
pygame.init()
# create the screen object
pygame.display.set_mode((Screen.width, Screen.height))

pygame.display.set_caption("Pygame")

level = 'medium'

if level=='easy':
    factory_flying = FactorySprites([Bird()], [300], [pygame.USEREVENT + 1])
    factory_landscape = FactorySprites([Cloud()], [400], [pygame.USEREVENT + 10])
elif level=='medium':
    factory_flying = FactorySprites([Bird(), Umbrella()], [400, 500], [pygame.USEREVENT + 1, pygame.USEREVENT + 2])
    factory_landscape = FactorySprites([Cloud(), Mountain()], [500, 2000,], [pygame.USEREVENT + 10, pygame.USEREVENT + 11])
else:
    factory_flying = FactorySprites([Bird(), Umbrella(), Jet(), Missile()], [400, 500, 600, 700], [pygame.USEREVENT + 1, pygame.USEREVENT + 2, pygame.USEREVENT + 3, pygame.USEREVENT + 4])
    factory_landscape = FactorySprites([Cloud(), Mountain()], [500, 2000,], [pygame.USEREVENT + 10, pygame.USEREVENT + 11])
    

# play
game = Game(factory_flying, factory_landscape)
game.play()