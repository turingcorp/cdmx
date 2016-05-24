#import "mradiationprecautionleveladvised.h"
#import "ecolor.h"

@interface mradiationprecautionlevel ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationprecautionleveladvised

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_precaution_level_advised", nil);
    self.color = [UIColor pollution_orange];
    
    return self;
}

@end