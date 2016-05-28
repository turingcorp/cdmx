#import "vclimatecellatmosphere.h"
#import "mclimatecurrentitematmosphere.h"
#import "efont.h"

static NSInteger const humidityimagesize = 50;

@implementation vclimatecellatmosphere

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
 
    UIImageView *humidityimage = [[UIImageView alloc] init];
    [humidityimage setClipsToBounds:YES];
    [humidityimage setUserInteractionEnabled:NO];
    [humidityimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [humidityimage setImage:[UIImage imageNamed:@"climate_humidity"]];
    [humidityimage setContentMode:UIViewContentModeCenter];
    
    UILabel *humiditylabel = [[UILabel alloc] init];
    [humiditylabel setUserInteractionEnabled:NO];
    [humiditylabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [humiditylabel setBackgroundColor:[UIColor clearColor]];
    [humiditylabel setFont:[UIFont numericsize:25]];
    [humiditylabel setTextColor:[UIColor blackColor]];
    self.humiditylabel = humiditylabel;
    
    [self addSubview:humidityimage];
    [self addSubview:humiditylabel];
    
    NSDictionary *views = @{@"humidityimage":humidityimage, @"humiditylabel":humiditylabel};
    NSDictionary *metrics = @{@"humidityimagesize":@(humidityimagesize)};
    
    self.layouthumidityleft = [NSLayoutConstraint constraintWithItem:humidityimage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[humidityimage(humidityimagesize)]-0-[humiditylabel(100)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[humidityimage(humidityimagesize)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[humiditylabel(humidityimagesize)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layouthumidityleft];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGFloat remain = width - (humidityimagesize * 2);
    CGFloat margin = remain / 2.0;
    self.layouthumidityleft.constant = margin;
    
    [super layoutSubviews];
}

#pragma mark -
#pragma mark climate cell

-(void)config:(mclimatecurrentitematmosphere*)model
{
    NSString *string = [NSString stringWithFormat:NSLocalizedString(@"vclimate_atmosphere_humidity", nil), @(model.atmosphere.humidity)];
    [self.humiditylabel setText:string];
}

@end