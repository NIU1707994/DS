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
    
    def make(self, event_type, i):
        return self.__prototypes[event_type - self.__eventTypes[0]].clone()