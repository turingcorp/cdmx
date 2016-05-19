#import "vpollutionmapdisplayannotation.h"
#import "efont.h"

static NSInteger const annotationwidthmin = 25;
static NSInteger const annotationheightmin = 32;
static NSInteger const annotationwidthmax = 53;
static NSInteger const annotationheightmax = 67;

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
    
    self.layoutlabeltop = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label(40)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutlabeltop];
    
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
        self.layoutlabeltop.constant = 8;
    }
    else
    {
        [self.img setImage:[[UIImage imageNamed:@"pollution_annsmall"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self setFrame:CGRectMake(0, 0, annotationwidthmin, annotationheightmax)];
        [self setCenterOffset:CGPointMake(0, annotationheightmin / -2.0)];
        [self.label setFont:[UIFont numericsize:9]];
        self.layoutlabeltop.constant = 11;
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