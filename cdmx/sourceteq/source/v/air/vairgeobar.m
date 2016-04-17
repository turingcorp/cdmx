#import "vairgeobar.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"

@implementation vairgeobar

-(instancetype)init:(cairgeo*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(navbarintrinsicwidth, navbarheight);
    
    return size;
}

@end