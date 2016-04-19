#import "mpagesitemsettings.h"
#import "csettings.h"

@implementation mpagesitemsettings

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_item_settings_name", nil);
    self.descr = NSLocalizedString(@"pages_item_settings_descr", nil);
    self.asset = @"general_logo";
    
    return self;
}

#pragma mark
#pragma mark pages item

-(UIViewController*)controller
{
    csettings *controller = [[csettings alloc] init];
    
    return controller;
}
@end