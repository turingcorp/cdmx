#import "vnodriveplatescell.h"

@implementation vnodriveplatescell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self.layer setCornerRadius:10];
    
    return self;
}

#pragma mark public

-(void)config:(mstationsnodriveplate*)model number:(NSNumber*)number
{
    [self setBackgroundColor:model.color];
}

@end