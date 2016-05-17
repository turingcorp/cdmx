#import "vmenubar.h"

@implementation vmenubar

-(instancetype)init:(ccontroller*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *logo = [[UIImageView alloc] init];
    [logo setUserInteractionEnabled:NO];
    [logo setClipsToBounds:YES];
    [logo setContentMode:UIViewContentModeCenter];
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [logo setImage:[[UIImage imageNamed:@"menu_city_pollution"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [logo setTintColor:[UIColor blueColor]];
    
    [self addSubview:logo];
    
    NSDictionary *views = @{@"logo":logo};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[logo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[logo(120)]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end