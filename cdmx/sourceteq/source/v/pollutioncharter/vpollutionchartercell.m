#import "vpollutionchartercell.h"
#import "efont.h"
#import "ecolor.h"

@implementation vpollutionchartercell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont boldsize:16]];
    [label setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mpollutionchartitem*)model
{
    [self.label setText:model.name];
    [self hover];
}

#pragma mark -
#pragma mark vcollectioncell

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setAlpha:1];
    }
    else
    {
        [self setAlpha:0.2];
    }
}

@end