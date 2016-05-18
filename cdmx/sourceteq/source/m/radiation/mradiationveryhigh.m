#import "mradiationveryhigh.h"
#import "ecolor.h"

@interface mradiation ()

@property(strong, nonatomic, readwrite)NSArray<mradiationactivity*> *activities;
@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationveryhigh

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_veryhigh", nil);
    self.color = [UIColor pollution_red];
    self.activities = @[
                        [mradiationactivity exercise:NO],
                        [mradiationactivity transport:NO],
                        [mradiationactivity outdoors:NO],
                        [mradiationactivity cafe:NO]
                        ];
    
    return self;
}

@end