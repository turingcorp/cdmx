#import "mnodrivetodayitemrestrictionpermit.h"

@interface mnodrivetodayitemrestriction ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *title;
@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivetodayitemrestrictionpermit

-(instancetype)init:(mnodrive*)model
{
    self = [super init];
    
    self.asset = @"nodrive_permit";
    self.title = NSLocalizedString(@"mnodrive_today_restriction_permit_title", nil);
    
    if(model.today.permit)
    {
        self.info = NSLocalizedString(@"mnodrive_today_restriction_permit_yes_info", nil);
    }
    else
    {
        self.info = NSLocalizedString(@"mnodrive_today_restriction_permit_no_info", nil);
    }
    
    return self;
}

@end