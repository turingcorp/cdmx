#import "mmenusectionitemclimate.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitemclimate

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_climate", nil);
    self.asset = @"menu_city_climate";
    
    return self;
}

@end