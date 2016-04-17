#import "vmenubanner.h"
#import "vblur.h"

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
    
    [self addSubview:background];
    
    NSDictionary *views = @{@"background":background};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[background]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[background]-0-|" options:0 metrics:metrics views:views]];

    
    return self;
}

@end