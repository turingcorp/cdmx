#import "vmenu.h"
#import "uicolor+uicolormain.h"

@implementation vmenu

-(instancetype)init:(cmenu*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    self.controller = controller;
    
    return self;
}

@end