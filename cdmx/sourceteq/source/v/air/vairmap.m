#import "vairmap.h"

@implementation vairmap

-(instancetype)init:(cair*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    self.controller = controller;
    
    UIImageView *background = [[UIImageView alloc] init];
    [background setUserInteractionEnabled:NO];
    [background setClipsToBounds:YES];
    [background setContentMode:UIViewContentModeScaleAspectFit];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background setImage:[UIImage imageNamed:@"districts_cdmx"]];
    
    [self addSubview:background];
    
    NSDictionary *views = @{@"back":background};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[back]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end