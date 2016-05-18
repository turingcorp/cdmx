#import "mradiationactivityexercise.h"

@interface mradiationactivity ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationactivityexercise

-(instancetype)init
{
    self = [super init];
    self.asset = @"menu_city_radiation";
    self.name = NSLocalizedString(@"mradiation_activity_exercise", nil);
    
    return self;
}

@end