#import "vviewbar.h"
#import "ecolor.h"
#import "efont.h"
#import "genericconstants.h"

@implementation vviewbar

-(instancetype)init:(ccontroller*)controller;
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, navbarheight);
    
    return size;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

-(void)actionmenu:(UIButton*)button
{
    [self.controller menu];
}

#pragma mark public

-(void)title:(NSString*)title
{
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont boldsize:16]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:title];
    self.labeltitle = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[label]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label(45)]" options:0 metrics:metrics views:views]];
}

-(void)buttonback
{
    UIButton *buttonleft = [[UIButton alloc] init];
    [buttonleft setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonleft.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonleft.imageView setClipsToBounds:YES];
    [buttonleft.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [buttonleft addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    [buttonleft setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    self.buttonleft = buttonleft;
    
    [self addSubview:buttonleft];
    
    NSDictionary *views = @{@"button":buttonleft};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(45)]" options:0 metrics:metrics views:views]];
}

-(void)buttonmenu
{
    UIButton *buttonleft = [[UIButton alloc] init];
    [buttonleft setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonleft.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonleft.imageView setClipsToBounds:YES];
    [buttonleft.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [buttonleft addTarget:self action:@selector(actionmenu:) forControlEvents:UIControlEventTouchUpInside];
    [buttonleft setImageEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 27)];
    self.buttonleft = buttonleft;
    
    [self addSubview:buttonleft];
    
    NSDictionary *views = @{@"button":buttonleft};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(45)]" options:0 metrics:metrics views:views]];
}

-(void)logo:(NSString*)asset
{
    UIImageView *imagecenter = [[UIImageView alloc] init];
    [imagecenter setClipsToBounds:YES];
    [imagecenter setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imagecenter setUserInteractionEnabled:NO];
    [imagecenter setContentMode:UIViewContentModeScaleAspectFit];
    [imagecenter setImage:[UIImage imageNamed:asset]];
    self.imagecenter = imagecenter;
    
    [self addSubview:imagecenter];
    
    NSDictionary *views = @{@"image":imagecenter};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[image]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[image(45)]" options:0 metrics:metrics views:views]];
}

@end