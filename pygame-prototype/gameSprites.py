import pygame
from pygame.locals import RLEACCEL
from abc import ABC, abstractmethod

class GameSprite(pygame.sprite.Sprite, ABC):
    def __init__(self):
        super(GameSprite, self).__init__()
    
    @abstractmethod
    def clone(self):
        return GameSprite()