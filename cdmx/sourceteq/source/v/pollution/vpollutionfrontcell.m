#import "vpollutionfrontcell.h"
#import "efont.h"
#import "ecolor.h"

static NSInteger const cellapparentheight = 80;

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
    [label setTextColor:[UIColor second]];
    [label setText:@"Magdalena Contreras"];
    self.label = label;
    
    UIButton *buttonup = [[UIButton alloc] init];
    [buttonup setClipsToBounds:YES];
    [buttonup setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonup setImage:[[UIImage imageNamed:@"generic_up"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonup setImage:[[UIImage imageNamed:@"generic_up"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonup.imageView setContentMode:UIViewContentModeCenter];
    [buttonup.imageView setTintColor:[[UIColor main] colorWithAlphaComponent:0.2]];
    [buttonup.imageView setClipsToBounds:YES];
    self.buttonup = buttonup;
    
    [self addSubview:label];
    [self addSubview:buttonup];
    
    NSDictionary *views = @{@"label":label, @"up":buttonup};
    NSDictionary *metrics = @{@"apparentheight":@(cellapparentheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[label]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[up]-(-20)-[label(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-35-[up]-35-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[up(60)]-(apparentheight)-|" options:0 metrics:metrics views:views]];
    
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

#pragma mark actions

-(void)actionup:(UIButton*)button
{
    [self.front showdetail];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.buttonup setHidden:NO];
        [self setAlpha:1];
    }
    else
    {
        [self.buttonup setHidden:YES];
        [self setAlpha:0.4];
    }
}

#pragma mark public

-(void)config:(mpollutionitem*)model front:(vpollutionfront*)front
{
    self.front = front;
    [self.label setText:model.name];
    [self hover];
}

@end