#import "aparserradiation.h"

@interface aparserradiation ()

@property(strong, nonatomic, readwrite)mradiation *radiation;

@end

@implementation aparserradiation

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        NSInteger current = 0;
        NSNumber *rawcurrent = self.validjson[@"current"];
        
        if(rawcurrent)
        {
            current = rawcurrent.integerValue;
        }
        
        self.radiation = [mradiation points:current];
    }
}

@end