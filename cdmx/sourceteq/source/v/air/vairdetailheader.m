#import "vairdetailheader.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

@implementation vairdetailheader

-(instancetype)init:(cairdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setUserInteractionEnabled:NO];
    [label setFont:[UIFont regularsize:20]];
    [label setTextColor:[UIColor whiteColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:controller.model.name];
    
    UIImageView *imagetemp = [[UIImageView alloc] init];
    [imagetemp setImage:[[UIImage imageNamed:@"stations_temp"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [imagetemp setTintColor:[UIColor whiteColor]];
    [imagetemp setUserInteractionEnabled:NO];
    [imagetemp setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imagetemp setClipsToBounds:YES];
    [imagetemp setContentMode:UIViewContentModeScaleAspectFit];
    
    UIImageView *rosewind = [[UIImageView alloc] init];
    [rosewind setImage:[[UIImage imageNamed:@"stations_rosewind"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [rosewind setTintColor:[UIColor whiteColor]];
    [rosewind setUserInteractionEnabled:NO];
    [rosewind setTranslatesAutoresizingMaskIntoConstraints:NO];
    [rosewind setClipsToBounds:YES];
    [rosewind setContentMode:UIViewContentModeScaleAspectFit];
    
    UIImageView *rosewindpointer = [[UIImageView alloc] init];
    [rosewindpointer setImage:[[UIImage imageNamed:@"stations_rosewindpointer"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [rosewindpointer setTintColor:[UIColor whiteColor]];
    [rosewindpointer setUserInteractionEnabled:NO];
    [rosewindpointer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [rosewindpointer setClipsToBounds:YES];
    [rosewindpointer setContentMode:UIViewContentModeScaleAspectFit];
    
    [self addSubview:label];
    [self addSubview:imagetemp];
    [self addSubview:rosewind];
    [self addSubview:rosewindpointer];
    
    NSDictionary *views = @{@"label":label, @"imagetemp":imagetemp, @"rosewind":rosewindpointer, @"rosewindpointer":rosewindpointer};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[label]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[imagetemp(26)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imagetemp(26)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[rosewind]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[rosewindpointer]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[rosewind(40)]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[rosewindpointer(40)]-50-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end