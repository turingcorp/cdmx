#import "vairgeomapann.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

static CGFloat const annwidth = 161;
static CGFloat const annheight = 99;

@implementation vairgeomapann

@dynamic annotation;

-(instancetype)init:(mstationsannotation*)annotation
{
    self = [super initWithFrame:CGRectMake(0, 0, annwidth, annheight)];
    [self setClipsToBounds:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setCenterOffset:CGPointMake(0, annheight / -2.0)];
    self.annotation = annotation;
    NSString *stringindex = @"";
    
    if(annotation.model.index.points > 0)
    {
        stringindex = [NSString stringWithFormat:@"%@", @(annotation.model.index.points)];
    }
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setImage:[[UIImage imageNamed:@"stations_annotation"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTintColor:annotation.model.index.color];
    self.img = image;
    
    UIImageView *stick = [[UIImageView alloc] init];
    [stick setClipsToBounds:YES];
    [stick setContentMode:UIViewContentModeScaleAspectFit];
    [stick setUserInteractionEnabled:NO];
    [stick setTranslatesAutoresizingMaskIntoConstraints:NO];
    [stick setImage:[[UIImage imageNamed:@"stations_annotationstick"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.stick = stick;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setTextColor:[UIColor colorWithWhite:0 alpha:0.9]];
    [labeltitle setFont:[UIFont regularsize:12]];
    [labeltitle setText:annotation.title];
    self.labeltitle = labeltitle;
    
    UILabel *labelindex = [[UILabel alloc] init];
    [labelindex setUserInteractionEnabled:NO];
    [labelindex setTextAlignment:NSTextAlignmentCenter];
    [labelindex setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindex setBackgroundColor:[UIColor clearColor]];
    [labelindex setTextColor:[UIColor blackColor]];
    [labelindex setFont:[UIFont regularsize:25]];
    [labelindex setText:stringindex];
    self.labelindex = labelindex;
    
    [self addSubview:stick];
    [self addSubview:image];
    [self addSubview:labeltitle];
    [self addSubview:labelindex];
    
    NSDictionary *views = @{@"image":image, @"stick":stick, @"title":labeltitle, @"index":labelindex};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[index]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[stick]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[stick]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[index(42)]-(-14)-[title]" options:0 metrics:metrics views:views]];
    
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
        [self.img setAlpha:1];
        [self.labeltitle setAlpha:1];
        [self.labelindex setAlpha:1];
        [self.stick setTintColor:[UIColor main]];
    }
    else
    {
        [self.img setAlpha:0.7];
        [self.labeltitle setAlpha:0.6];
        [self.labelindex setAlpha:0.6];
        [self.stick setTintColor:[UIColor colorWithWhite:0 alpha:0.16]];
    }
}

@end