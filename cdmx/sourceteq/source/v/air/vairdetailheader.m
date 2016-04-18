#import "vairdetailheader.h"
#import "uicolor+uicolormain.h"

@implementation vairdetailheader

-(instancetype)init:(cairdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    return self;
}

@end