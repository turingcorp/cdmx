#import "mpagesitemair.h"
#import "cair.h"

@implementation mpagesitemair

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_item_air_name", nil);
    self.descr = NSLocalizedString(@"pages_item_air_descr", nil);
    self.asset = @"general_environment";
    
    return self;
}

#pragma mark
#pragma mark pages item

-(UIViewController*)controller
{
    cair *controller = [[cair alloc] init];
    
    return controller;
}

@end