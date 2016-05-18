#import "mradiationlow.h"
#import "ecolor.h"

@interface mradiation ()

@property(strong, nonatomic, readwrite)NSArray<mradiationactivity*> *activities;
@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationlow

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_low", nil);
    self.color = [UIColor pollution_green];
    self.activities = @[
                        [mradiationactivity exercise:YES],
                        [mradiationactivity transport:YES],
                        [mradiationactivity outdoors:YES],
                        [mradiationactivity cafe:YES]
                        ];
    
    return self;
}

@end