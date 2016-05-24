#import "mmenusectionitempollution.h"
#import "cpollution.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitempollution

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_pollution", nil);
    self.asset = @"menu_city_pollution";
    
    return self;
}

#pragma mark -
#pragma mark item

-(UIViewController*)controller
{
    cpollution *controller = [[cpollution alloc] init];
    
    return controller;
}

@end