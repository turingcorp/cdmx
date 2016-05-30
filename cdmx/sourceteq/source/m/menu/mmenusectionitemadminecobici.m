#import "mmenusectionitemadminecobici.h"
#import "cadminecobici.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitemadminecobici

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_adminecobici", nil);
    self.asset = @"generic_logo";
    
    return self;
}

#pragma mark -
#pragma mark item

-(UIViewController*)controller
{
    cadminecobici *controller = [[cadminecobici alloc] init];
    
    return controller;
}

@end