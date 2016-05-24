#import "mradiationhigh.h"
#import "ecolor.h"

@interface mradiation ()

@property(strong, nonatomic, readwrite)NSArray<mradiationactivity*> *activities;
@property(strong, nonatomic, readwrite)NSArray<mradiationprecaution*> *precautions;
@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationhigh

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_high", nil);
    self.color = [UIColor pollution_orange];
    self.activities = @[
                        [mradiationactivity exercise:NO],
                        [mradiationactivity transport:NO],
                        [mradiationactivity outdoors:NO],
                        [mradiationactivity cafe:YES]
                        ];
    
    self.precautions = @[
                         [mradiationprecaution umbrella:[mradiationprecautionlevel advised]],
                         [mradiationprecaution shades:[mradiationprecautionlevel advised]],
                         [mradiationprecaution sunscreen:[mradiationprecautionlevel mandatory]]
                         ];
    
    return self;
}

@end