import pygame
from pygame.locals import RLEACCEL
from abc import ABC, abstractmethod

class GameSprite(pygame.sprite.Sprite, ABC):
    def __init__(self):
        pass
    
    @abstractmethod
    def clone():
        return GameSprite()