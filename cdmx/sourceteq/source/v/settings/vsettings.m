#import "vsettings.h"
#import "vsettingsbar.h"
#import "genericconstants.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "msettings.h"
#import "analytics.h"

@implementation vsettings

-(instancetype)init:(csettings*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;

    vsettingsbar *bar = [[vsettingsbar alloc] init:controller];
    
    UILabel *title = [[UILabel alloc] init];
    [title setText:NSLocalizedString(@"not_title", nil)];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont regularsize:18]];
    [title setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    
    UILabel *descr = [[UILabel alloc] init];
    [descr setText:NSLocalizedString(@"not_descr", nil)];
    [descr setTranslatesAutoresizingMaskIntoConstraints:NO];
    [descr setUserInteractionEnabled:NO];
    [descr setFont:[UIFont regularsize:14]];
    [descr setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [descr setNumberOfLines:0];
    
    UISwitch *sw = [[UISwitch alloc] init];
    [sw setTranslatesAutoresizingMaskIntoConstraints:NO];
    [sw setOnTintColor:[UIColor main]];
    [sw setOn:[msettings singleton].notifications];
    [sw addTarget:self action:@selector(actionswitch:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:bar];
    [self addSubview:title];
    [self addSubview:descr];
    [self addSubview:sw];
    
    NSDictionary *views = @{@"bar":bar, @"title":title, @"sw":sw, @"descr":descr};
    NSDictionary *metrics = @{@"barheight":@(navbarheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(barheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title(200)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[sw]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[descr(200)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-35-[sw]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-30-[title]-4-[descr]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionswitch:(UISwitch*)sw
{
    [msettings singleton].notifications = sw.isOn;
    [[msettings singleton] save];
    
    if(sw.isOn)
    {
        [[analytics singleton] trackevent:ga_event_settings_notifications action:ga_action_on label:nil];
    }
    else
    {
        [[analytics singleton] trackevent:ga_event_settings_notifications action:ga_action_off label:nil];
    }
}

@end