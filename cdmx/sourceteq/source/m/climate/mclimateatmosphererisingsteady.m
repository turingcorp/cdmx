#import "mclimateatmosphererisingsteady.h"

@interface mclimateatmosphererising ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mclimateatmosphererisingsteady

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mclimate_atmosphere_rising_steady", nil);
    
    return self;
}

@end