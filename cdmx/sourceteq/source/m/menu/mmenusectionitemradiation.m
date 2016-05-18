#import "mmenusectionitemradiation.h"
#import "cradiation.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitemradiation

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_radiation", nil);
    self.asset = @"menu_city_radiation";
    
    return self;
}

#pragma mark -
#pragma mark item

-(UIViewController*)controller
{
    cradiation *controller = [[cradiation alloc] init];
    
    return controller;
}


@end