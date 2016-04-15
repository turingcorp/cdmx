#import "vaircellmaincell.h"

static NSInteger const cornerradius = 3;

@implementation vaircellmaincell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self.layer setCornerRadius:cornerradius];
    
    return self;
}

#pragma mark public

-(void)config:(NSIndexPath*)index model:(mstationsreadinguvindex*)model
{
    UIColor *color;
    
    if(index.item <= model.number)
    {
        color = model.color;
    }
    else
    {
        color = [UIColor colorWithWhite:0 alpha:0.1];
    }
    
    [self setBackgroundColor:color];
}

@end