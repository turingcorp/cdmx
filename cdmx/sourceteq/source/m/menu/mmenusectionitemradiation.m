#import "mmenusectionitemradiation.h"

@interface mmenusectionitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mmenusectionitemradiation

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_item_radiation", nil);
    self.asset = @"menu_city_pollution";
    
    return self;
}

@end