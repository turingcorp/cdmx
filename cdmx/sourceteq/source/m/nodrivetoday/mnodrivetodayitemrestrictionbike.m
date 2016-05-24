#import "mnodrivetodayitemrestrictionbike.h"

@interface mnodrivetodayitemrestriction ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *title;
@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivetodayitemrestrictionbike

-(instancetype)init:(mnodrive*)model
{
    self = [super init];
    
    self.asset = @"nodrive_bike";
    self.title = NSLocalizedString(@"mnodrive_today_restriction_bike_title", nil);
    
    if(model.bikesrestricted)
    {
        self.info = NSLocalizedString(@"mnodrive_today_restriction_bike_yes_info", nil);
    }
    else
    {
        self.info = NSLocalizedString(@"mnodrive_today_restriction_bike_no_info", nil);
    }
    
    return self;
}

@end