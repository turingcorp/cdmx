#import "vpollutionpollutantdetailbar.h"
#import "efont.h"
#import "ecolor.h"

@implementation vpollutionpollutantdetailbar

-(instancetype)init:(cpollutionpollutantdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIButton *buttonleft = [[UIButton alloc] init];
    [buttonleft setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonleft setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonleft.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonleft.imageView setClipsToBounds:YES];
    [buttonleft.imageView setTintColor:[UIColor blackColor]];
    [buttonleft addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    [buttonleft setImageEdgeInsets:UIEdgeInsetsMake(6, 0, 6, 15)];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont boldsize:35]];
    [title setTextColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [title setTextAlignment:NSTextAlignmentCenter];
    self.title = title;
    
    UILabel *subtitle = [[UILabel alloc] init];
    [subtitle setBackgroundColor:[UIColor clearColor]];
    [subtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [subtitle setUserInteractionEnabled:NO];
    [subtitle setFont:[UIFont boldsize:13]];
    [subtitle setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [subtitle setTextAlignment:NSTextAlignmentCenter];
    [subtitle setText:controller.model.name];
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:[UIColor background]];
    [border setClipsToBounds:YES];
    
    [self addSubview:border];
    [self addSubview:title];
    [self addSubview:subtitle];
    [self addSubview:buttonleft];
    
    NSDictionary *views = @{@"button":buttonleft, @"title":title, @"subtitle":subtitle, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(45)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=60)-[title(52)]-0-[subtitle(15)]-(<=50)-[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[subtitle]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end