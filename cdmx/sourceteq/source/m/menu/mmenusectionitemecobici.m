#import "mmenusectionitemecobici.h"
#import "cecobici.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitemecobici

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_ecobici", nil);
    self.asset = @"menu_mobility_ecobici";
    
    return self;
}

#pragma mark -
#pragma mark item

-(UIViewController*)controller
{
    cecobici *controller = [[cecobici alloc] init];
    
    return controller;
}

@end