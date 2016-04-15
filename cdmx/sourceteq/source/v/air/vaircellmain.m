#import "vaircellmain.h"
#import "mstations.h"

@implementation vaircellmain

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
    
    NSString *stringtitle = [[mstations singleton] uv];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIImageView *icontemp = [[UIImageView alloc] init];
    [icontemp setClipsToBounds:YES];
    [icontemp setUserInteractionEnabled:NO];
    [icontemp setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icontemp setContentMode:UIViewContentModeScaleAspectFit];
    [icontemp setImage:[UIImage imageNamed:@"stations_temp"]];
    
    UIImageView *iconhum = [[UIImageView alloc] init];
    [iconhum setClipsToBounds:YES];
    [iconhum setUserInteractionEnabled:NO];
    [iconhum setTranslatesAutoresizingMaskIntoConstraints:NO];
    [iconhum setContentMode:UIViewContentModeScaleAspectFit];
    [iconhum setImage:[UIImage imageNamed:@"stations_humidity"]];
    
    [self addSubview:label];
    [self addSubview:icontemp];
    [self addSubview:iconhum];
    
    NSDictionary *views = @{@"icontemp":icontemp, @"iconhum":iconhum, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icontemp(20)]-100-[iconhum(20)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[icontemp(30)]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[iconhum(25)]-51-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end