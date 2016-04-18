#import "vairgeomapann.h"

static CGFloat const annwidth = 161;
static CGFloat const annheight = 99;

@implementation vairgeomapann

-(instancetype)init:(mstationsannotation*)annotation
{
    self = [super initWithFrame:CGRectMake(0, 0, annwidth, annheight)];
    [self setClipsToBounds:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setImage:[UIImage imageNamed:@"stations_annotation"]];
    
    UIImageView *stick = [[UIImageView alloc] init];
    [stick setClipsToBounds:YES];
    [stick setContentMode:UIViewContentModeScaleAspectFit];
    [stick setUserInteractionEnabled:NO];
    [stick setTranslatesAutoresizingMaskIntoConstraints:NO];
    [stick setImage:[[UIImage imageNamed:@"stations_annotationstick"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [stick setTintColor:annotation.index.color];
    
    [self addSubview:stick];
    [self addSubview:image];
    
    CGFloat halfheight = annheight / 2.0;
    NSDictionary *views = @{@"image":image, @"stick":stick};
    NSDictionary *metrics = @{@"half":@(halfheight), @"minushalf":@(-halfheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(minushalf)-[image]-(half)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[stick]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(minushalf)-[stick]-(half)-|" options:0 metrics:metrics views:views]];
    
    return self;
}
@end