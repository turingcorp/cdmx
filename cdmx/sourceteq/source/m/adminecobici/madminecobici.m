#import "madminecobici.h"

@interface madminecobici ()

@property(strong, nonatomic, readwrite)NSArray<madminecobicistation*> *stations;

@end

@implementation madminecobici

-(instancetype)init
{
    self = [super init];
    self.stations = [NSArray array];
    
    return self;
}

#pragma mark public

-(void)append:(NSArray<madminecobicistation*>*)stations
{
    NSMutableArray<madminecobicistation*> *compiled = [NSMutableArray arrayWithArray:self.stations];
    [compiled addObjectsFromArray:stations];
    self.stations = compiled;
}

-(NSArray<mdbecobicistation*>*)dbmodel
{
    NSMutableArray<mdbecobicistation*> *array = [NSMutableArray array];
    NSInteger countstations = self.stations.count;
    
    for(NSUInteger indexstation = 0; indexstation < countstations; indexstation++)
    {
        madminecobicistation *model = self.stations[indexstation];
        mdbecobicistation *dbmodel = [[mdbecobicistation alloc] init];
        dbmodel.stationid = model.stationid;
        dbmodel.name = model.name;
        dbmodel.latitude = model.latitude;
        dbmodel.longitude = model.longitude;
        
        [array addObject:dbmodel];
    }
    
    return array;
}

@end