#import "mclimate.h"

@interface mclimatewind ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface mclimateatmosphere ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface mclimate ()

@property(strong, nonatomic, readwrite)mclimatewind *wind;
@property(strong, nonatomic, readwrite)mclimateatmosphere *atmosphere;

@end

@implementation mclimate

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    NSDictionary *query = dictionary[@"query"];
    NSDictionary *results = query[@"results"];
    NSDictionary *channel = results[@"channel"];
    NSDictionary *rawwind = channel[@"wind"];
    NSDictionary *rawatmosphere = channel[@"atmosphere"];
    
    self.wind = [[mclimatewind alloc] init:rawwind];
    self.atmosphere = [[mclimateatmosphere alloc] init:rawatmosphere];

    NSLog(@"%@", self);
    
    return self;
}

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"climate >\n"];
    [string appendFormat:@"%@\n", self.wind];
    [string appendFormat:@"%@", self.atmosphere];
    
    return string;
}

@end