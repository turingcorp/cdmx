#import "vclimatecellwind.h"
#import "mclimatecurrentitemwind.h"

@implementation vclimatecellwind

#pragma mark -
#pragma mark climate cell

-(void)config:(mclimatecurrentitemwind*)model
{
    [self.wind removeFromSuperview];
    vclimatewind *wind = [[vclimatewind alloc] init:model.wind];
    self.wind = wind;
    
    [self addSubview:wind];
    
    NSDictionary *views = @{@"wind":wind};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[wind]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[wind]-0-|" options:0 metrics:metrics views:views]];
}

@end