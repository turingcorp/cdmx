#import "mclimate.h"

static CGFloat const milestokmratio = 1.60934;

@interface mclimatewind ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface mclimate ()

@property(strong, nonatomic, readwrite)mclimatewind *wind;

@end

@implementation mclimate

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    NSDictionary *query = dictionary[@"query"];
    NSDictionary *results = query[@"results"];
    NSDictionary *channel = results[@"channel"];
    NSDictionary *rawwind = channel[@"wind"];
    
    self.wind = [[mclimatewind alloc] init:rawwind];
    
    NSLog(@"%@", self.wind);
    
    return self;
}

@end