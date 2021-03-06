#import "vpollutionfrontcell.h"
#import "genericconstants.h"
#import "efont.h"
#import "ecolor.h"

@implementation vpollutionfrontcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldsize:14]];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    UIView *base = [[UIView alloc] init];
    [base setClipsToBounds:YES];
    [base setUserInteractionEnabled:NO];
    [base setTranslatesAutoresizingMaskIntoConstraints:NO];
    [base.layer setCornerRadius:3];
    self.base = base;
    
    UIButton *buttonup = [[UIButton alloc] init];
    [buttonup setClipsToBounds:YES];
    [buttonup setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonup setImage:[[UIImage imageNamed:@"generic_up"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonup setImage:[[UIImage imageNamed:@"generic_up"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonup.imageView setContentMode:UIViewContentModeCenter];
    [buttonup.imageView setTintColor:[[UIColor main] colorWithAlphaComponent:0.2]];
    [buttonup.imageView setClipsToBounds:YES];
    [buttonup addTarget:self action:@selector(actionup:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonup = buttonup;
    
    [base addSubview:label];
    [self addSubview:base];
    [self addSubview:buttonup];
    
    NSDictionary *views = @{@"label":label, @"up":buttonup, @"base":base};
    NSDictionary *metrics = @{@"apparentheight":@(pollution_drawableheight - 82), @"baseheight":@(pollution_drawableheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[base]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[up]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(baseheight)-[base(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(apparentheight)-[up(140)]" options:0 metrics:metrics views:views]];
    
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
    [self.front showdetail:YES];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.buttonup setHidden:NO];
        [self.label setTextColor:[UIColor whiteColor]];
        [self.base setBackgroundColor:[UIColor main]];
    }
    else
    {
        [self.buttonup setHidden:YES];
        [self.label setTextColor:[UIColor colorWithWhite:0.7 alpha:1]];
        [self.base setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark public

-(void)config:(mpollutionfrontitem*)model front:(vpollutionfront*)front
{
    self.front = front;
    [self.label setText:model.name];
    [self hover];
}

@end