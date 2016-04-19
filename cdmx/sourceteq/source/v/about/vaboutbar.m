#import "vaboutbar.h"
#import "vmenubutton.h"

@implementation vaboutbar

-(instancetype)init:(csettings*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    vmenubutton *menubutton = [[vmenubutton alloc] init];
    [menubutton addTarget:self action:@selector(actionmenu:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setImage:[UIImage imageNamed:@"general_logo"]];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setUserInteractionEnabled:NO];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeCenter];
    
    [self addSubview:icon];
    [self addSubview:menubutton];
    
    NSDictionary *views = @{@"menubutton":menubutton, @"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menubutton]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menubutton]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[icon]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionmenu:(UIButton*)button
{
    [self.controller openmenu];
}

@end