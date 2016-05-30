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
        
        self.stations = stations;
    }
}

@end