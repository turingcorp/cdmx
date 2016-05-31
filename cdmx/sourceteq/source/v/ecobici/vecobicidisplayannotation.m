#import "vecobicidisplayannotation.h"

static NSInteger const annotationwidthmin = 40;
static NSInteger const annotationheightmin = 64;
static NSInteger const annotationwidthmax = 100;
static NSInteger const annotationheightmax = 158;

@interface vecobicidisplayannotation ()

@property(weak, nonatomic)mecobiciitemannotation *annotation;

@end

@implementation vecobicidisplayannotation

@dynamic annotation;

-(instancetype)initWithAnnotation:(mecobiciitemannotation*)annotation reuseIdentifier:(NSString*)identifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:identifier];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setClipsToBounds:NO];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setTintColor:[UIColor blackColor]];
    self.img = image;
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark public

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.img setImage:[[UIImage imageNamed:@"ecobici_annotationbig"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self.img setTintColor:[UIColor blackColor]];
        [self setFrame:CGRectMake(0, 0, annotationwidthmax, annotationheightmax)];
        [self setCenterOffset:CGPointMake(0, annotationheightmax / -2.0)];
    }
    else
    {
        [self.img setImage:[[UIImage imageNamed:@"ecobici_annotationsmall"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self.img setTintColor:[UIColor colorWithWhite:0.6 alpha:1]];
        [self setFrame:CGRectMake(0, 0, annotationwidthmin, annotationheightmax)];
        [self setCenterOffset:CGPointMake(0, annotationheightmin / -2.0)];
    }
}

@end