#import "vpollutionpollutantdetailbar.h"
#import "efont.h"
#import "ecolor.h"

@implementation vpollutionpollutantdetailbar

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor second]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *buttonleft = [[UIButton alloc] init];
    [buttonleft setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonleft.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonleft.imageView setClipsToBounds:YES];
    [buttonleft.imageView setTintColor:[UIColor whiteColor]];
    [buttonleft addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    [buttonleft setImageEdgeInsets:UIEdgeInsetsMake(6, 0, 6, 15)];
    
    [self addSubview:buttonleft];
    
    NSDictionary *views = @{@"button":buttonleft};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(45)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    
}

@end