#import "vpollutionmapdisplayannotation.h"
#import "efont.h"

static NSInteger const annotationwidthmin = 40;
static NSInteger const annotationheightmin = 60;
static NSInteger const annotationwidthmax = 60;
static NSInteger const annotationheightmax = 90;

@interface vpollutionmapdisplayannotation ()

@property(weak, nonatomic)mpollutionmapitemannotation *annotation;

@end

@implementation vpollutionmapdisplayannotation

@dynamic annotation;

-(instancetype)initWithAnnotation:(mpollutionmapitemannotation*)annotation reuseIdentifier:(NSString*)identifier
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
    self.img = image;
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTintColor:[UIColor blackColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    [self addSubview:image];
    [self addSubview:label];
    
    NSDictionary *views = @{@"image":image, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[label(40)]" options:0 metrics:metrics views:views]];
    
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

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.img setImage:[[UIImage imageNamed:@"pollution_annbig"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self setFrame:CGRectMake(0, 0, annotationwidthmax, annotationheightmax)];
        [self setCenterOffset:CGPointMake(0, annotationheightmax / -2.0)];
        [self.label setFont:[UIFont numericsize:20]];
        [self setAlpha:1];
    }
    else
    {
        [self.img setImage:[[UIImage imageNamed:@"pollution_annsmall"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self setFrame:CGRectMake(0, 0, annotationwidthmin, annotationheightmax)];
        [self setCenterOffset:CGPointMake(0, annotationheightmin / -2.0)];
        [self.label setFont:[UIFont numericsize:9]];
        [self setAlpha:0.7];
    }
}

#pragma mark public

-(void)config
{
    NSString *stringindex = [NSString stringWithFormat:@"%@", self.annotation.index];
    [self.label setText:stringindex];
    [self.img setTintColor:self.annotation.index.color];
    
    [self hover];
}

@end