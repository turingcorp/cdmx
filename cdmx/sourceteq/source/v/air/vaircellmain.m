#import "vaircellmain.h"

@implementation vaircellmain

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
    
    UIImageView *icontemp = [[UIImageView alloc] init];
    [icontemp setClipsToBounds:YES];
    [icontemp setUserInteractionEnabled:NO];
    [icontemp setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icontemp setContentMode:UIViewContentModeScaleAspectFit];
    [icontemp setImage:[UIImage imageNamed:@"stations_temp"]];
    
    [self addSubview:icontemp];
    
    NSDictionary *views = @{@"icontemp":icontemp};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icontemp(20)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[icontemp(30)]-15-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end