#import "aparserstations.h"

@implementation aparserstations

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        NSLog(@"%@", self.validjson);
    }
}

@end