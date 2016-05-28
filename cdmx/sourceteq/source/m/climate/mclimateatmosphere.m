#import "mclimateatmosphere.h"

@interface mclimateatmosphererising ()

+(instancetype)status:(NSInteger)status;

@end

@interface mclimateatmosphere ()

@property(strong, nonatomic, readwrite)mclimateatmosphererising *rising;
@property(assign, nonatomic, readwrite)NSInteger humidity;

@end

@implementation mclimateatmosphere

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    NSNumber *rawrising = dictionary[@"rising"];
    NSNumber *rawhumidity = dictionary[@"humidity"];
    self.rising = [mclimateatmosphererising status:rawrising.integerValue];
    self.humidity = rawhumidity.integerValue;
    
    return self;
}

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"atmosphere: "];
    [string appendFormat:@"%@ ", self.rising];
    [string appendFormat:@"[humidity %@]", @(self.humidity)];
    
    return string;
}

@end