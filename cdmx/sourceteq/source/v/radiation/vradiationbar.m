#import "vradiationbar.h"
#import "genericconstants.h"
#import "ecolor.h"

@implementation vradiationbar

-(instancetype)init:(cradiation*)controller
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
    [buttonleft addTarget:self action:@selector(actionbuttonleft:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonright = [[UIButton alloc] init];
    [buttonright setClipsToBounds:YES];
    [buttonright setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonright setImage:[[UIImage imageNamed:@"generic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonright setImage:[[UIImage imageNamed:@"generic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonright.imageView setClipsToBounds:YES];
    [buttonright.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonright.imageView setTintColor:[UIColor main]];
    [buttonright addTarget:self action:@selector(actionbuttonright:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:buttonleft];
    [self addSubview:buttonright];
    
    NSDictionary *views = @{@"buttonleft":buttonleft, @"buttonright":buttonright};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonleft(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonright(60)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[buttonleft]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[buttonright]-0-|" options:0 metrics:metrics views:views]];
    
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
    
}

-(void)actionbuttonright:(UIButton*)button
{
    
}

@end