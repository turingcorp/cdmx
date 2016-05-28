#import "mclimatecondition.h"

@interface mclimatecondition ()

@property(assign, nonatomic, readwrite)NSInteger temp;
@property(assign, nonatomic, readwrite)NSInteger code;

@end

@implementation mclimatecondition

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
    [string appendString:@"condition: "];
    [string appendFormat:@"[temp %@] ", @(self.temp)];
    [string appendFormat:@"[code %@]", @(self.code)];
    
    return string;
}

@end