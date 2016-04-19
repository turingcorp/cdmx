#import "mpagesitemnodrive.h"
#import "ccars.h"

@implementation mpagesitemnodrive

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_item_air_name", nil);
    self.descr = NSLocalizedString(@"pages_item_air_descr", nil);
    self.asset = @"general_cars";
    
    return self;
}

#pragma mark
#pragma mark pages item

-(UIViewController*)controller
{
    ccars *controller = [[ccars alloc] init];
    
    return controller;
}

@end