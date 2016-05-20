#import "mmenusectionitemnodrive.h"
#import "cnodrive.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitemnodrive

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_nodrive", nil);
    self.asset = @"menu_city_pollution";
    
    return self;
}

#pragma mark -
#pragma mark item

-(UIViewController*)controller
{
    cnodrive *controller = [[cnodrive alloc] init];
    
    return controller;
}

@end