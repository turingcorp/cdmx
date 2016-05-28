#import "mclimatewind.h"
#import "mclimate.h"

@interface mclimatewind ()

@property(assign, nonatomic, readwrite)NSInteger chill;
@property(assign, nonatomic, readwrite)NSInteger direction;
@property(assign, nonatomic, readwrite)NSInteger speed;

@end

@implementation mclimatewind

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];

    NSNumber *rawchill = dictionary[@"chill"];
    NSNumber *rawdirection = dictionary[@"direction"];
    NSNumber *rawspeed = dictionary[@"speed"];
    self.chill = rawchill.integerValue;
    self.direction = rawdirection.integerValue;
    self.speed = rawspeed.integerValue;
    
    [self converttointernational];
    
    return self;
}

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"wind: "];
    [string appendFormat:@"[chill %@]", @(self.chill)];
    [string appendFormat:@"[direction %@]", @(self.direction)];
    [string appendFormat:@"[speed %@]", @(self.speed)];
    
    return string;
}

#pragma mark functionality

-(void)converttointernational
{
    self.chill = [mclimate celsiusfrom:self.chill];
    self.speed = [mclimate kilometersfrom:self.speed];
}

@end