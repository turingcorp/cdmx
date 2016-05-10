#import "aparserpollution.h"

@implementation aparserpollution

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        NSDictionary *rawdistricts = self.validjson[@"districts"];
        NSArray *rawdaily = self.validjson[@"daily"];
        NSArray *rawhourly = self.validjson[@"hourly"];
    }
}

@end