#import "vairgeobar.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"
#import "uifont+uifontmain.h"

@implementation vairgeobar

-(instancetype)init:(cairgeo*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setClipsToBounds:YES];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"general_backbutton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"general_backbutton"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonback.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont regularsize:16]];
    [label setUserInteractionEnabled:NO];
    [label setText:NSLocalizedString(@"air_map_title", nil)];
    
    [self addSubview:label];
    [self addSubview:buttonback];
    
    NSDictionary *views = @{@"buttonback":buttonback, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonback(45)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(navbarintrinsicwidth, navbarheight);
    
    return size;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end