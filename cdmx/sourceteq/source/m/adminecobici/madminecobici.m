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

@end