#import "vmenu.h"
#import "uicolor+uicolormain.h"
#import "vmenubanner.h"

static NSUInteger const bannerheight = 200;

@implementation vmenu

-(instancetype)init:(cmenu*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    self.controller = controller;
    
    vmenubanner *banner = [[vmenubanner alloc] init];
    
    [self addSubview:banner];
    
    NSDictionary *views = @{@"banner":banner};
    NSDictionary *metrics = @{@"bannerheight":@(bannerheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[banner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[banner(bannerheight)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end