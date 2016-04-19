#import "vsettings.h"
#import "vsettingsbar.h"
#import "genericconstants.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "msettings.h"

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
    
    [self addSubview:bar];
    [self addSubview:title];
    [self addSubview:sw];
    [self addSubview:descr];
    
    NSDictionary *views = @{@"bar":bar, @"title":title, @"sw":sw, @"descr":descr};
    NSDictionary *metrics = @{@"barheight":@(navbarheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(barheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title(250)]-10-[sw]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[descr(250)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-30-[sw]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-30-[title]-4-[descr]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions



@end