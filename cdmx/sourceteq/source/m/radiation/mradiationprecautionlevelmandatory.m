#import "mradiationprecautionlevelmandatory.h"
#import "ecolor.h"

@interface mradiationprecautionlevel ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationprecautionlevelmandatory

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_precaution_level_mandatory", nil);
    self.color = [UIColor pollution_red];
    
    return self;
}

@end