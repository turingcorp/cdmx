#import "vclimatecell.h"

@implementation vclimatecell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    return self;
}

#pragma mark public

-(void)config:(mclimatecurrentitem*)model
{
    
}

@end