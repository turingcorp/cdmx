#import "vpollutionrecommendation.h"
#import "cpollutionrecommendation.h"
#import "efont.h"

@implementation vpollutionrecommendation

-(instancetype)init:(cpollutionrecommendation*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:controller.model.name];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont regularsize:17]];
    [label setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end