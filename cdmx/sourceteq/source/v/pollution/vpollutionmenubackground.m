#import "vpollutionmenubackground.h"

static CGFloat const middlecoloralpha = 0.7;
static CGFloat const bottomcoloralpha = 1;

@interface vpollutionmenubackground ()

@property(weak, nonatomic)CAGradientLayer *gradient;

@end

@implementation vpollutionmenubackground

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
 
    UIColor *topcolor = [UIColor colorWithWhite:1 alpha:0];
    UIColor *middlecolor = [UIColor colorWithWhite:1 alpha:middlecoloralpha];
    UIColor *bottomcolor = [UIColor colorWithWhite:1 alpha:bottomcoloralpha];
    
    NSArray *colors = @[
                        (id)topcolor.CGColor,
                        (id)middlecolor.CGColor,
                        (id)bottomcolor.CGColor
                        ];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    self.gradient = gradient;
    self.gradient.colors = colors;
    [self.layer addSublayer:self.gradient];
    
    return self;
}

-(void)layoutSubviews
{
    self.gradient.frame = self.bounds;
}

@end