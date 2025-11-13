import pygame
import random
from pygame.locals import RLEACCEL
from colissionSprites import CollisionSprites
from screen import Screen

class Jet(CollisionSprites):
    
    def __init__(self):
        super(Jet, self).__init__()
        self.surf = pygame.image.load("icons/jet.png").convert()
        self.surf = pygame.transform.flip(self.surf, True, False)
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
        speed_x = -self.speed * 2
        self.rect.move_ip(speed_x, 0)
        if self.rect.right < 0:
            self.kill()
            
    def clone(self):                
        return Jet()