class FactorySprites():
    def __init__ (self, prototypes, periods, eventTypes):
        self.__prototypes = prototypes
        self.__eventTypes = eventTypes
        self.__periods =  periods

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