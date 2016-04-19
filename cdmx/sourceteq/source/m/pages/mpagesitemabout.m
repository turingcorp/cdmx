#import "mpagesitemabout.h"
#import "<#header#>"

@implementation mpagesitemabout

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_item_nodrive_name", nil);
    self.descr = NSLocalizedString(@"pages_item_nodrive_descr", nil);
    self.asset = @"general_nodrive";
    
    return self;
}

#pragma mark
#pragma mark pages item

-(UIViewController*)controller
{
    cnodrive *controller = [[cnodrive alloc] init];
    
    return controller;
}

@end