#import "mnodrivetodayitemrestrictiontourist.h"

@interface mnodrivetodayitemrestriction ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *title;
@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivetodayitemrestrictiontourist

-(instancetype)init:(mnodrive*)model
{
    self = [super init];
    
    self.asset = @"nodrive_tourist";
    self.title = NSLocalizedString(@"mnodrive_today_restriction_tourist_title", nil);
    
    if(model.allstates)
    {
        self.info = NSLocalizedString(@"mnodrive_today_restriction_tourist_no_info", nil);
    }
    else
    {
        self.info = NSLocalizedString(@"mnodrive_today_restriction_tourist_yes_info", nil);
    }
    
    return self;
}

@end