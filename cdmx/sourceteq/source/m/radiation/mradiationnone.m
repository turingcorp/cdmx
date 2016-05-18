#import "mradiationnone.h"
#import "ecolor.h"

@interface mradiation ()

@property(strong, nonatomic, readwrite)NSArray<mradiationactivity*> *activities;
@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationnone

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_none", nil);
    self.color = [UIColor background];
    self.activities = @[
                        [mradiationactivity exercise:YES],
                        [mradiationactivity transport:YES],
                        [mradiationactivity outdoors:YES],
                        [mradiationactivity cafe:YES]
                        ];
    
    return self;
}

@end