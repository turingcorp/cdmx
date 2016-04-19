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
    [title setText:@"Recibir notificacion"];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont regularsize:15]];
    [title setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    
    UISwitch *sw = [[UISwitch alloc] init];
    [sw setTranslatesAutoresizingMaskIntoConstraints:NO];
    [sw setOnTintColor:[UIColor main]];
    [sw setOn:[msettings singleton].notifications];
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"title":title, @"sw":sw};
    NSDictionary *metrics = @{@"barheight":@(navbarheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(barheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title(150)]-10-[sw]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-30-[sw]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-30-[title]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end