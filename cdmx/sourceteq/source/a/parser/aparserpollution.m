#import "aparserpollution.h"

@interface aparserpollution ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionitem*> *modelhourly;

@end

@implementation aparserpollution

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        NSDictionary *rawdistricts = self.validjson[@"districts"];
        NSArray *rawdaily = self.validjson[@"daily"];
        NSArray *rawhourly = self.validjson[@"hourly"];
        NSMutableArray<mpollutionitem*> *modelhourly = [NSMutableArray array];
        
        NSUInteger counthours = rawhourly.count;
        
        for(NSUInteger indexhour = 0; indexhour < counthours; indexhour++)
        {
            NSDictionary *rawhour = rawhourly[indexhour];
            NSNumber *rawhourhour = rawhour[@"hour"];
            NSNumber *rawhourpollution = rawhour[@"pollution"];
            
            mpollutionitem *modelhour = [mpollutionitem pollutionhourly:rawhourhour pollution:rawhourpollution];
            [modelhourly addObject:modelhour];
        }
        
        self.modelhourly = modelhourly;
    }
}

@end