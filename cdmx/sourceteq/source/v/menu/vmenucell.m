#import "vmenucell.h"

@implementation vmenucell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark public

-(void)config:(mpagesitem*)model
{
    self.model = model;
}

@end