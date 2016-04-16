#import "vairbar.h"
#import "uicolor+uicolormain.h"
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
    self.menubutton = menubutton;
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setImage:[UIImage imageNamed:@"general_environment"]];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setUserInteractionEnabled:NO];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    self.icon = icon;
    
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

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(navbarintrinsicwidth, navbarheight);
    
    return size;
}

-(void)layoutSubviews
{
    __weak typeof(self) welf = self;
    CGFloat delta = (navbarheight - welf.bounds.size.height) / 35.0;
    CGFloat alpha = 1 - delta;
    
    if(alpha < 0)
    {
        alpha = 0;
    }
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf.menubutton setAlpha:alpha];
                       [welf.icon setAlpha:alpha];
                   });
    
    [super layoutSubviews];
}

#pragma mark actions

-(void)actionmenu:(UIButton*)button
{
    [self.controller openmenu];
}

@end