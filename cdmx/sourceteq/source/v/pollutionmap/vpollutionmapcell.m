#import "vpollutionmapcell.h"
#import "efont.h"
#import "ecolor.h"

@implementation vpollutionmapcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    UILabel *label = [[UILabel alloc] init];
    [label setClipsToBounds:YES];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont boldsize:13]];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mpollutionmapitem*)model
{
    [self.label setText:model.name];
    [self hover];
}

#pragma mark -
#pragma mark collection cell

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setBackgroundColor:[UIColor main]];
        [self.label setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.label setTextColor:[UIColor colorWithWhite:0.6 alpha:1]];
    }
}

@end