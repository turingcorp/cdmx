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
    
    if(rawnumber.integerValue && rawname && rawlocation)
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
        
        NSArray *splitlocation = [rawlocation componentsSeparatedByString:@", "];
        NSUInteger locationcount = splitlocation.count;
        
        if(locationcount == 2)
        {
            NSString *rawlatitude = splitlocation[0];
            NSString *rawlongitude = splitlocation[1];
            CGFloat floatlatitude = rawlatitude.floatValue;
            CGFloat floatlongitude = rawlongitude.floatValue;
            
            if(!floatlatitude)
            {
                self.latitude = @(floatlatitude);
            }
            
            if(!floatlongitude)
            {
                self.longitude = @(floatlongitude);
            }
        }
    }
    
    return self;
}

@end