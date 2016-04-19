#import "vaboutcell.h"

@implementation vaboutcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark public

-(instancetype)config:(maboutitem*)model
{
    
}

@end