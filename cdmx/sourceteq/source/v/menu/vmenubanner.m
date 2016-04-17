#import "vmenubanner.h"
#import "uifont+uifontmain.h"

@implementation vmenubanner

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *background = [[UIImageView alloc] init];
    [background setUserInteractionEnabled:NO];
    [background setClipsToBounds:YES];
    [background setImage:[UIImage imageNamed:@"general_map"]];
    [background setContentMode:UIViewContentModeScaleAspectFill];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIImageView *logo = [[UIImageView alloc] init];
    [logo setUserInteractionEnabled:NO];
    [logo setClipsToBounds:YES];
    [logo setImage:[UIImage imageNamed:@"general_logo"]];
    [logo setContentMode:UIViewContentModeScaleAspectFit];
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [logo setAlpha:0.3];
    
    UILabel *title = [[UILabel alloc] init];
    [title setUserInteractionEnabled:NO];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setFont:[UIFont regularsize:30]];
    [title setTextColor:[UIColor whiteColor]];
    [title setText:@"CDMX"];
    [title setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:background];
    [self addSubview:logo];
    [self addSubview:title];
    
    NSDictionary *views = @{@"background":background, @"logo":logo, @"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[background]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[background]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[logo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[title]-35-[logo(40)]-4-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end