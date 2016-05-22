#import "mnodrivetodayitemrestrictionforeigner.h"

@interface mnodrivetodayitemrestriction ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *title;
@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivetodayitemrestrictionforeigner

-(instancetype)init:(mnodrive*)model
{
    self = [super init];
    
    self.asset = @"nodrive_country";
    self.title = NSLocalizedString(@"mnodrive_today_restriction_foreigner_title", nil);
    
    if(model.allstates)
    {
        self.info = NSLocalizedString(@"mnodrive_today_restriction_foreigner_yes_info", nil);
    }
    else
    {
        
        self.info = NSLocalizedString(@"mnodrive_today_restriction_foreigner_no_info", nil);
    }
    
    return self;
}

@end