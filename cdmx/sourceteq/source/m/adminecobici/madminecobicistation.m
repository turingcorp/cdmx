#import "madminecobicistation.h"

@interface madminecobicistation ()

@property(copy, nonatomic, readwrite)NSNumber *stationid;
@property(copy, nonatomic, readwrite)NSNumber *latitude;
@property(copy, nonatomic, readwrite)NSNumber *longitude;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation madminecobicistation

-(instancetype)init:(NSDictionary*)dictionary
{
    NSNumber *rawnumber = dictionary[@"id"];
    NSString *rawname = dictionary[@"name"];
    NSString *rawlocation = dictionary[@"location"];
    
    if(rawnumber.integerValue && rawname.length)
    {
        self = [super init];
        self.stationid = rawnumber;
        
        NSArray *splitname = [rawname componentsSeparatedByString:@" "];
        NSMutableString *realname = [NSMutableString string];
        NSUInteger splitnamecount = splitname.count;
        
        for(NSUInteger indexsplitname = 1; indexsplitname < splitnamecount; indexsplitname++)
        {
            if(indexsplitname > 1)
            {
                [realname appendString:@" "];
            }
            
            NSString *splittedstring = splitname[indexsplitname];
            
            if(splittedstring.length > 1)
            {
                NSString *capital = [splittedstring substringToIndex:1].uppercaseString;
                NSString *noncapital = [splittedstring substringFromIndex:1].lowercaseString;
                
                [realname appendString:capital];
                [realname appendString:noncapital];
            }
            else
            {
                [realname appendString:splittedstring];
            }
        }
        
        self.name = realname;
    }
    
    NSLog(@"name: ", self.name);
    
    return self;
}

@end