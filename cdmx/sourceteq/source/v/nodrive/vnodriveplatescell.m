#import "vnodriveplatescell.h"

@implementation vnodriveplatescell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    return self;
}

#pragma mark public

-(void)config:(mstationsnodriveplate*)model
{
    [self setBackgroundColor:model.color];
}

@end