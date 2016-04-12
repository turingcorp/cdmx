#import "vmenucell.h"

@implementation vmenucell
{
    NSDictionary *attrname;
    NSDictionary *attrdescr;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
 
    UILabel *title = [[UILabel alloc] init];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setNumberOfLines:0];
    [title setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:title];
    
    return self;
}

#pragma mark public

-(void)config:(mpagesitem*)model
{
    self.model = model;
}

@end