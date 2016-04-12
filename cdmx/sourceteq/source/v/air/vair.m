#import "vair.h"
#import "vairbar.h"

@implementation vair

-(instancetype)init:(cair*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vairbar *bar;
    
    return self;
}

@end