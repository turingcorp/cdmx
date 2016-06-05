#import "mmenusectionitemadminmetro.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitemadminmetro

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_adminmetro", nil);
    self.asset = @"generic_logo";
    
    return self;
}

#pragma mark -
#pragma mark item

-(UIViewController*)controller
{
    UIViewController *controller = [[UIViewController alloc] init];
    
    return controller;
}

@end