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

-(void)config:(mstationsreadinguvindex*)model
{
    [self setBackgroundColor:model.color];
}

@end