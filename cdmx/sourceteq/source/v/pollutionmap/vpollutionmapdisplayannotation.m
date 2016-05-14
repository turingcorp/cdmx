#import "vpollutionmapdisplayannotation.h"

static NSInteger const annotationwidth = 40;
static NSInteger const annotationheight = 60;

@interface vpollutionmapdisplayannotation ()

@property(weak, nonatomic)mpollutionmapitemannotation *annotation;

@end

@implementation vpollutionmapdisplayannotation

@dynamic annotation;

-(instancetype)initWithAnnotation:(mpollutionmapitemannotation*)annotation reuseIdentifier:(NSString*)identifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:identifier];
    [self setFrame:CGRectMake(0, 0, annotationwidth, annotationheight)];
    [self setClipsToBounds:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setCenterOffset:CGPointMake(0, annotationheight / -2.0)];

    NSString *stringindex = [NSString stringWithFormat:@"%@", annotation.index];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setTintColor:annotation.index.color];
    self.img = image;
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    [self hover];
    
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
    }
    else
    {
        [self.img setImage:[[UIImage imageNamed:@"pollution_annsmall"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    }
}

@end