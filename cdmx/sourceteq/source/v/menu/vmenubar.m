#import "vmenubar.h"

static NSInteger const menubarheight = 150;

@implementation vmenubar

-(instancetype)init:(ccontroller*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, menubarheight);
    
    return size;
}

@end