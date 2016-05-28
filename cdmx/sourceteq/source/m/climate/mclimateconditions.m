#import "mclimateconditions.h"

@interface mclimateconditions ()

@property(assign, nonatomic, readwrite)NSInteger temp;
@property(assign, nonatomic, readwrite)NSInteger code;

@end

@implementation mclimateconditions

-(instancetype)init:(NSDictionary*)dictionary;
{
    self = [super init];
    
    NSNumber *rawtemp = dictionary[@"temp"];
    NSNumber *rawcode = dictionary[@"code"];
    self.temp = rawtemp.integerValue;
    self.code = rawcode.integerValue;
    
    return self;
}

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"conditions: "];
    [string appendFormat:@"[temp %@] ", @(self.temp)];
    [string appendFormat:@"[code %@]", @(self.code)];
    
    return string;
}

@end