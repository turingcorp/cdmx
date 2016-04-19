#import "vnodriveplatescell.h"
#import "uifont+uifontmain.h"
#import "tools.h"

@implementation vnodriveplatescell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self.layer setCornerRadius:10];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldsize:38]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor blackColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mstationsnodriveplate*)model number:(NSNumber*)number
{
    [self setBackgroundColor:model.color];
    [self.label setText:[[tools singleton] numbertostring:number]];
}

@end