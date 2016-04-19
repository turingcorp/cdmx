#import "mpagesitemsettings.h"

@implementation mpagesitemsettings

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_item_about_name", nil);
    self.descr = NSLocalizedString(@"pages_item_about_descr", nil);
    self.asset = @"general_logo";
    
    return self;
}

#pragma mark
#pragma mark pages item

-(UIViewController*)controller
{
    cabout *controller = [[cabout alloc] init];
    
    return controller;
}
@end