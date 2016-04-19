#import "vsettingsbar.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"
#import "vmenubutton.h"

@implementation vsettingsbar

-(instancetype)init:(csettings*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor second]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    vmenubutton *menubutton = [[vmenubutton alloc] init];
    [menubutton addTarget:self action:@selector(actionmenu:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setImage:[UIImage imageNamed:@"general_settings"]];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setUserInteractionEnabled:NO];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    
    [self addSubview:icon];
    [self addSubview:menubutton];
    
    NSDictionary *views = @{@"menubutton":menubutton, @"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menubutton]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menubutton]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[icon]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon(30)]-8-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionmenu:(UIButton*)button
{
    [self.controller openmenu];
}

@end