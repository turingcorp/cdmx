#import "mmenusectionitemabout.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitemabout

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_about", nil);
    self.asset = @"menu_city_pollution";
    
    return self;
}

@end