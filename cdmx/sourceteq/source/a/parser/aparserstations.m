#import "aparserstations.h"
#import "tools.h"

@implementation aparserstations

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        NSDictionary *pollution = self.validjson[@"pollutionMeasurements"];
        
        if(pollution)
        {
            NSString *pollutiontimestamp = pollution[@"timeStamp"];
            
            NSDate *date = [[tools singleton] stringtodate:pollutiontimestamp];
            
            NSLog(@"%@", date);
        }
    }
}

-(NSData*)cleandata:(NSData*)data
{
    NSString *cleanstring = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
    NSData *cleaneddata = [cleanstring dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    
    return cleaneddata;
}

@end