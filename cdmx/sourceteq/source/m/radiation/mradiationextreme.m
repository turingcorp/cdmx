#import "mradiationextreme.h"
#import "ecolor.h"

@interface mradiation ()

@property(strong, nonatomic, readwrite)NSArray<mradiationactivity*> *activities;
@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationextreme

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_extreme", nil);
    self.color = [UIColor pollution_violet];
    self.activities = @[
                        [mradiationactivity exercise:NO],
                        [mradiationactivity transport:NO],
                        [mradiationactivity outdoors:NO],
                        [mradiationactivity cafe:NO]
                        ];
    
    return self;
}

@end