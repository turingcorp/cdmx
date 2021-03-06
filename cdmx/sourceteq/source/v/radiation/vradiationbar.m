#import "vradiationbar.h"
#import "genericconstants.h"
#import "efont.h"

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
    [buttonleft.imageView setTintColor:[UIColor blackColor]];
    [buttonleft setImageEdgeInsets:UIEdgeInsetsMake(11, 0, 11, 18)];
    [buttonleft addTarget:self action:@selector(actionbuttonleft:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonright = [[UIButton alloc] init];
    [buttonright setClipsToBounds:YES];
    [buttonright setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonright setBackgroundColor:[UIColor clearColor]];
    [buttonright setTitle:NSLocalizedString(@"vradiation_buttonright_title", nil) forState:UIControlStateNormal];
    [buttonright setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonright setTitleColor:[UIColor colorWithWhite:0.9 alpha:1] forState:UIControlStateHighlighted];
    [buttonright addTarget:self action:@selector(actionbuttonright:) forControlEvents:UIControlEventTouchUpInside];
    [buttonright.titleLabel setFont:[UIFont boldsize:12]];
    
    [self addSubview:buttonleft];
    [self addSubview:buttonright];
    
    NSDictionary *views = @{@"buttonleft":buttonleft, @"buttonright":buttonright};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonleft(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonright(60)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonleft(45)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonright(45)]-0-|" options:0 metrics:metrics views:views]];
    
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
    [self.controller about];
}

@end