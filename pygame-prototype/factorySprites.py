class FactorySprites():
    def __init__ (self, prototypes, periods, eventTypes):
        self.__prototypes = prototypes
        self.__eventTypes = eventTypes
        self.__periods =  periods
    
    def make(self):
        return self._prototypes[event_type - self.__eventTypes[0]].clone()