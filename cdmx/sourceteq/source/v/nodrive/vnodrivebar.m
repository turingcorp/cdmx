#import "vnodrivebar.h"
#import "genericconstants.h"
#import "ecolor.h"
#import "efont.h"

@implementation vnodrivebar

-(instancetype)init:(cnodrive*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIButton *buttonleft = [[UIButton alloc] init];
    [buttonleft setClipsToBounds:YES];
    [buttonleft setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonleft.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonleft.imageView setClipsToBounds:YES];
    [buttonleft.imageView setTintColor:[UIColor main]];
    [buttonleft setImageEdgeInsets:UIEdgeInsetsMake(11, 0, 11, 18)];
    [buttonleft addTarget:self action:@selector(actionbuttonleft:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonright = [[UIButton alloc] init];
    [buttonright setClipsToBounds:YES];
    [buttonright setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonright setImage:[[UIImage imageNamed:@"generic_calendar"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonright setImage:[[UIImage imageNamed:@"generic_calendar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonright.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonright.imageView setClipsToBounds:YES];
    [buttonright.imageView setTintColor:[UIColor main]];
    [buttonright setImageEdgeInsets:UIEdgeInsetsMake(12, 18, 12, 0)];
    [buttonright addTarget:self action:@selector(actionbuttonright:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor background]];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setClipsToBounds:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldsize:14]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:NSLocalizedString(@"vnodrive_title", nil)];
    
    [self addSubview:label];
    [self addSubview:buttonleft];
    [self addSubview:buttonright];
    [self addSubview:border];
    
    NSDictionary *views = @{@"buttonleft":buttonleft, @"buttonright":buttonright, @"border":border, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonleft(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonright(60)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonleft(45)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonright(45)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label(45)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, navbarheight);
    
    return size;
}

#pragma mark actions

-(void)actionbuttonleft:(UIButton*)button
{
    [self.controller menu];
}

-(void)actionbuttonright:(UIButton*)button
{
    [self.controller calendar];
}

@end