#import "vairbar.h"
#import "uicolor+uicolormain.h"

static NSUInteger const navbarintrinsicwidth = 320;

@implementation vairbar

-(instancetype)init:(cair*)controller
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