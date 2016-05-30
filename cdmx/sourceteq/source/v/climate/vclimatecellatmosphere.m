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
    [humidityimage setContentMode:UIViewContentModeScaleAspectFit];
    
    UILabel *humiditylabel = [[UILabel alloc] init];
    [humiditylabel setUserInteractionEnabled:NO];
    [humiditylabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [humiditylabel setBackgroundColor:[UIColor clearColor]];
    [humiditylabel setFont:[UIFont numericsize:18]];
    [humiditylabel setTextColor:[UIColor blackColor]];
    self.humiditylabel = humiditylabel;
    
    UIImageView *risingimage = [[UIImageView alloc] init];
    [risingimage setClipsToBounds:YES];
    [risingimage setUserInteractionEnabled:NO];
    [risingimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [risingimage setContentMode:UIViewContentModeCenter];
    self.risingimage = risingimage;
    
    [self addSubview:humidityimage];
    [self addSubview:humiditylabel];
    [self addSubview:risingimage];
    
    NSDictionary *views = @{@"humidityimage":humidityimage, @"humiditylabel":humiditylabel, @"risingimage":risingimage};
    NSDictionary *metrics = @{@"humidityimagesize":@(humidityimagesize), @"risingwidth":@(humidityimagesize * 2)};
    
    self.layouthumidityleft = [NSLayoutConstraint constraintWithItem:humidityimage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    self.layoutrisingleft = [NSLayoutConstraint constraintWithItem:risingimage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[humidityimage(humidityimagesize)]-(-8)-[humiditylabel(humidityimagesize)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[risingimage(risingwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[humidityimage(25)]-2-[risingimage(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[humiditylabel(25)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layouthumidityleft];
    [self addConstraint:self.layoutrisingleft];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGFloat remain = width - (humidityimagesize * 2);
    CGFloat margin = remain / 2.0;
    self.layouthumidityleft.constant = margin + 10;
    self.layoutrisingleft.constant = margin;
    
    [super layoutSubviews];
}

#pragma mark -
#pragma mark climate cell

-(void)config:(mclimatecurrentitematmosphere*)model
{
    NSString *string = [NSString stringWithFormat:NSLocalizedString(@"vclimate_atmosphere_humidity", nil), @(model.atmosphere.humidity)];
    [self.humiditylabel setText:string];
    [self.risingimage setImage:[UIImage imageNamed:model.atmosphere.rising.asset]];
}

@end