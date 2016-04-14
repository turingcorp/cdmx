#import "vaircell.h"

@implementation vaircell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *cloud = [[UIImageView alloc] init];
    [cloud setClipsToBounds:YES];
    [cloud setUserInteractionEnabled:NO];
    [cloud setTranslatesAutoresizingMaskIntoConstraints:NO];
    [cloud setImage:[[UIImage imageNamed:@"stations_cloud"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [cloud setContentMode:UIViewContentModeScaleAspectFit];
    
    self.cloud = cloud;
    
    [self addSubview:cloud];
    
    NSDictionary *views = @{@"cloud":cloud};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cloud(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[cloud]-5-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mstationsreadingitem*)model
{
    [self.cloud setTintColor:model.index.color];
}

@end