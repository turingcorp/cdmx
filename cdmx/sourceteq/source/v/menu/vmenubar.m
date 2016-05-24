#import "vmenubar.h"
#import "ecolor.h"
#import "cmenu.h"

@implementation vmenubar

-(instancetype)init:(cmenu*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *logo = [[UIImageView alloc] init];
    [logo setUserInteractionEnabled:NO];
    [logo setClipsToBounds:YES];
    [logo setContentMode:UIViewContentModeCenter];
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [logo setImage:[UIImage imageNamed:@"generic_logo"]];
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:[UIColor main]];
    
    [self addSubview:border];
    [self addSubview:logo];
    
    NSDictionary *views = @{@"logo":logo, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[logo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[logo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end