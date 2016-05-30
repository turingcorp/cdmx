#import "vadminecobici.h"

@implementation vadminecobici

-(instancetype)init:(ccontroller*)controller
{
    self = [super init:controller];
    [self.bar title:NSLocalizedString(@"mmenu_item_adminecobici", nil)];
    [self.bar buttonmenu];
    
    return self;
}

@end