import pygame
import random
import math
from pygame.locals import RLEACCEL
from gameSprites import GameSprite
from screen import Screen

class Missile(GameSprite):
    Max_Speed = 10
    Min_Speed = 5

    def __init__(self):
        super(Missile, self).__init__()
        self.surf = pygame.image.load("icons/missile.png").convert()
        self.surf.set_colorkey((255, 255, 255), RLEACCEL)
        self.rect = self.surf.get_rect(
            center=(
                Screen.width + 100,
                random.randint(0, Screen.height),
            )
        )
        self.speed = random.randint(self.Min_Speed, self.Max_Speed)
        self.time = 0

    def update(self):
        self.time += 1
        speed_x = -self.speed * 3
        self.rect.move_ip(speed_x, 0)
        if self.rect.right < 0:
            self.kill()
            
    def clone(self):                
        return Missile()