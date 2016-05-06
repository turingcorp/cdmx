#import "vpollutionimeca.h"

@implementation vpollutionimeca

-(instancetype)init:(ccontroller*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:NSLocalizedString(@"vpollutionimeca_title", nil)];
    
    UILabel *label = [[UILabel alloc] init];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end