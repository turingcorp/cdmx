#import "vmenubar.h"
#import "cmenu.h"

@implementation vmenubar

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.7]];
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
    [border setBackgroundColor:[UIColor blackColor]];
    
    UIView *borderbottom = [[UIView alloc] init];
    [borderbottom setUserInteractionEnabled:NO];
    [borderbottom setClipsToBounds:YES];
    [borderbottom setTranslatesAutoresizingMaskIntoConstraints:NO];
    [borderbottom setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    
    [self addSubview:border];
    [self addSubview:borderbottom];
    [self addSubview:logo];
    
    NSDictionary *views = @{@"logo":logo, @"border":border, @"borderbottom":borderbottom};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[borderbottom]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderbottom(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[logo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=40)-[logo(100)]-(<=70)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end