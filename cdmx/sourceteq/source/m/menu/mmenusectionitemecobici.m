#import "mmenusectionitemecobici.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitemecobici

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_ecobici", nil);
    self.asset = @"menu_city_pollution";
    
    return self;
}

@end