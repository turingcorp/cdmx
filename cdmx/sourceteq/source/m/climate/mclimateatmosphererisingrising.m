#import "mclimateatmosphererisingrising.h"

@interface mclimateatmosphererising ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mclimateatmosphererisingrising

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mclimate_atmosphere_rising_rising", nil);
    
    return self;
}

@end