#import "vairmap.h"
#import "genericconstants.h"
#import "uicolor+uicolormain.h"

static NSInteger marginvr = 30;

@implementation vairmap

-(instancetype)init:(cair*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    self.controller = controller;
    
    CGFloat height = airmapheight - (marginvr + marginvr);
    
    UIImageView *background = [[UIImageView alloc] init];
    [background setUserInteractionEnabled:NO];
    [background setClipsToBounds:YES];
    [background setContentMode:UIViewContentModeScaleAspectFit];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background setImage:[[UIImage imageNamed:@"districts_cdmx"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [background setTintColor:[UIColor collection]];
    
    [self addSubview:background];
    
    NSDictionary *views = @{@"back":background};
    NSDictionary *metrics = @{@"height":@(height), @"marginvr":@(marginvr)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(marginvr)-[back(height)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end