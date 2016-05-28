#import "mclimate.h"

@interface mclimatecondition ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface mclimatewind ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface mclimateatmosphere ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface mclimate ()

@property(strong, nonatomic, readwrite)mclimatecondition *condition;
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
    NSDictionary *item = channel[@"item"];
    NSDictionary *rawcondition = item[@"condition"];
    NSDictionary *rawwind = channel[@"wind"];
    NSDictionary *rawatmosphere = channel[@"atmosphere"];
    
    self.condition = [[mclimatecondition alloc] init:rawcondition];
    self.wind = [[mclimatewind alloc] init:rawwind];
    self.atmosphere = [[mclimateatmosphere alloc] init:rawatmosphere];

    NSLog(@"%@", self);
    
    return self;
}

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"climate >\n"];
    [string appendFormat:@"%@\n", self.condition];
    [string appendFormat:@"%@\n", self.wind];
    [string appendFormat:@"%@", self.atmosphere];
    
    return string;
}

@end