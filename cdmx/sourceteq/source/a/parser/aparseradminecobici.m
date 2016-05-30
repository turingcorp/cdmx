#import "aparseradminecobici.h"

@interface aparseradminecobici ()

@property(strong, nonatomic, readwrite)NSArray<madminecobicistation*> *stations;

@end

@implementation aparseradminecobici

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        NSMutableArray<madminecobicistation*> *stations = [NSMutableArray array];
        NSArray *jsonstations = (NSArray*)self.validjson;
        
        for(NSDictionary *rawstation in jsonstations)
        {
            madminecobicistation *station = [[madminecobicistation alloc] init:rawstation];
            
            if(station)
            {
                [stations addObject:station];
            }
        }
        
        self.stations = stations;
    }
}

@end