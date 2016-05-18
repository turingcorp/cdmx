#import "mradiationmid.h"
#import "ecolor.h"

@interface mradiation ()

@property(strong, nonatomic, readwrite)NSArray<mradiationactivity*> *activities;
@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationmid

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_mid", nil);
    self.color = [UIColor pollution_yellow];
    self.activities = @[
                        [mradiationactivity exercise:NO],
                        [mradiationactivity transport:YES],
                        [mradiationactivity outdoors:YES],
                        [mradiationactivity cafe:YES]
                        ];
    
    return self;
}

@end