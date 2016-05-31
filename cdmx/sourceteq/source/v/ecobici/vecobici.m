#import "vecobici.h"
#import "vecobicimenu.h"

static NSInteger const ecobicimenuheight = 50;

@implementation vecobici

-(instancetype)init:(cecobici*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vecobicimenu *menu = [[vecobicimenu alloc] init:controller];
    
    [self addSubview:menu];
    
    NSDictionary *views = @{@"menu":menu};
    NSDictionary *metrics = @{@"menuheight":@(ecobicimenuheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(menuheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end