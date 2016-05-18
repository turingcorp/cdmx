#import "mradiationactivityoutdoors.h"

@interface mradiationactivity ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationactivityoutdoors

-(instancetype)init
{
    self = [super init];
    self.asset = @"menu_city_radiation";
    self.name = NSLocalizedString(@"mradiation_activity_outdoors", nil);
    
    return self;
}

@end