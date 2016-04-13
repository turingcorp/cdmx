#import "vairbar.h"
#import "uicolor+uicolormain.h"
#import "vmenubutton.h"
#import "genericconstants.h"

@implementation vairbar

-(instancetype)init:(cair*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    vmenubutton *menubutton = [[vmenubutton alloc] init];
    [menubutton addTarget:self action:@selector(actionmenu:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:menubutton];
    
    NSDictionary *views = @{@"menubutton":menubutton};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menubutton]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menubutton]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(navbarintrinsicwidth, navbarheight);
    
    return size;
}

#pragma mark actions

-(void)actionmenu:(UIButton*)button
{
    [self.controller openmenu];
}

@end