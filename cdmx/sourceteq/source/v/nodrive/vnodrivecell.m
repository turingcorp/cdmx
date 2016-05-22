#import "vnodrivecell.h"

@implementation vnodrivecell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    return self;
}

#pragma mark public

-(void)config:(mnodrivetodayitem*)model
{
    
}

@end