from gameSprites import GameSprite

class CollisionSprites(GameSprite):
    Max_Speed = 10
    Min_Speed = 5
    
    def __init__(self):
        super(CollisionSprites, self).__init__()
        self.speed = 0
        self.time = 0