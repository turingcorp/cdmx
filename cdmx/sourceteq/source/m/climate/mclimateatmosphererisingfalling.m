#import "mclimateatmosphererisingfalling.h"

@interface mclimateatmosphererising ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mclimateatmosphererisingfalling

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mclimate_atmosphere_rising_falling", nil);
    
    return self;
}

@end