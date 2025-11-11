import pygame
from pygame.locals import RLEACCEL

from screen import Screen
from landscapeSprites import LandscapeSprites

class Mountain(LandscapeSprites):
    def __init__(self):
        super(Mountain, self).__init__()
        self.surf = pygame.image.load("icons/mountain.png").convert()
        self.surf.set_colorkey((0, 0, 0), RLEACCEL)
        # The starting position is randomly generated
        self.rect = self.surf.get_rect(
            center=(
                Screen.width + 100,
                Screen.height - 50,
            )
        )

    def update(self):
        self.rect.move_ip(-5, 0)
        if self.rect.right < 0:
            self.kill()
            
    def clone(self):
        return Mountain()