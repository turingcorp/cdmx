#import "mnodrivetodayitemrestrictiontime.h"

@interface mnodrivetodayitemrestriction ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *title;
@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivetodayitemrestrictiontime

-(instancetype)init:(mnodrive*)model
{
    self = [super init];
    
    self.asset = @"nodrive_clock";
    self.title = NSLocalizedString(@"mnodrive_today_restriction_time_title", nil);
    self.info = NSLocalizedString(@"mnodrive_today_restriction_time_info", nil);
    
    return self;
}

@end