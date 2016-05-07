#import "vpollutionfrontcell.h"
#import "efont.h"
#import "ecolor.h"

static NSInteger const cellapparentheight = 160;

@implementation vpollutionfrontcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldsize:14]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor main]];
    [label setText:@"Magdalena Contreras"];
    
    UIView *topbar = [[UIView alloc] init];
    [topbar setBackgroundColor:[UIColor second]];
    [topbar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [topbar setClipsToBounds:YES];
    [topbar setUserInteractionEnabled:NO];
    self.topbar = topbar;
    
    [self addSubview:label];
    [self addSubview:topbar];
    
    NSDictionary *views = @{@"label":label, @"topbar":topbar};
    NSDictionary *metrics = @{@"apparentheight":@(cellapparentheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[label]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topbar]-0-[label(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-35-[topbar]-35-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topbar(3)]-(apparentheight)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.topbar setHidden:NO];
    }
    else
    {
        [self.topbar setHidden:YES];
    }
}

#pragma mark public

-(void)config
{
    
}

@end