import pygame
import random
import math
from pygame.locals import RLEACCEL
from gameSprites import GameSprite
from screen import Screen

class Umbrella(GameSprite):
    Max_Speed = 10
    Min_Speed = 5

    def __init__(self):
        super(Umbrella, self).__init__()
        self.surf = pygame.image.load("icons/umbrella.png").convert()
        self.surf.set_colorkey((255, 255, 255), RLEACCEL)
        self.rect = self.surf.get_rect(
            center=(
                random.randint(0, Screen.width),
                random.randint(-100, -40),
            )
        )
        self.speed = random.randint(self.Min_Speed, self.Max_Speed)
        self.time = 0

    def update(self):
        self.time += 1
        speed_y = self.speed
        speed_x = 0.75 * self.speed \
                  * math.sin(2 * math.pi * self.time / (0.05 * Screen.height))
        self.rect.move_ip(speed_x, speed_y)
        if self.rect.top > Screen.height:
            self.kill()
            
    def clone(self):                
        return Umbrella()