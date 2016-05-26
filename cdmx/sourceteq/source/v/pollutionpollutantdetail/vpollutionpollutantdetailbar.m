#import "vpollutionpollutantdetailbar.h"
#import "efont.h"
#import "ecolor.h"

@implementation vpollutionpollutantdetailbar

-(instancetype)init:(cpollutionpollutantdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor second]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIButton *buttonleft = [[UIButton alloc] init];
    [buttonleft setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonleft.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonleft.imageView setClipsToBounds:YES];
    [buttonleft.imageView setTintColor:[UIColor whiteColor]];
    [buttonleft addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    [buttonleft setImageEdgeInsets:UIEdgeInsetsMake(6, 0, 6, 15)];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont boldsize:35]];
    [title setTextColor:[UIColor whiteColor]];
    [title setTextAlignment:NSTextAlignmentCenter];
    self.title = title;
    
    UILabel *subtitle = [[UILabel alloc] init];
    [subtitle setBackgroundColor:[UIColor clearColor]];
    [subtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [subtitle setUserInteractionEnabled:NO];
    [subtitle setFont:[UIFont boldsize:14]];
    [subtitle setTextColor:[UIColor whiteColor]];
    [subtitle setTextAlignment:NSTextAlignmentCenter];
    [subtitle setText:controller.model.name];
    
    [self addSubview:title];
    [self addSubview:subtitle];
    [self addSubview:buttonleft];
    
    NSDictionary *views = @{@"button":buttonleft, @"title":title, @"subtitle":subtitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(45)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[title(50)]-0-[subtitle(16)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[subtitle]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end