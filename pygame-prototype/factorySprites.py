class FactorySprites():
    def __init__ (self, prototypes, periods, eventType):
        self.__prototypes = prototypes
        self.__eventTypes = self.init_events(eventType)
        self.__periods =  periods

    def init_events(self, starting_event):
        return [starting_event + i for i in range(len(self.__prototypes))]

    def getPeriods(self):
        return self.__periods
    
    def getEventTypes(self):
        return self.__eventTypes
    
    def getPrototypes(self):
        return self.__prototypes
    
    def getEventTypesByPosition(self, i):
        return self.__eventTypes[i]
    
    def make(self, eventType):
        return self.__prototypes[eventType - self.__eventTypes[0]].clone()