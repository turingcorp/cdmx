#import "mclimatewind.h"

@interface mclimatewind ()

@property(assign, nonatomic, readwrite)CGFloat speed;
@property(assign, nonatomic, readwrite)NSInteger direction;

@end

@implementation mclimatewind

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];

    NSNumber *rawdirection = dictionary[@"direction"];
    NSNumber *rawspeed = dictionary[@"speed"];
    self.speed = rawspeed.floatValue;
    self.direction = rawdirection.integerValue;
    
    return self;
}

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"wind: "];
    [string appendFormat:@"[direction %@] ", @(self.direction)];
    [string appendFormat:@"[speed %@]", @(self.speed)];
    
    return string;
}

@end