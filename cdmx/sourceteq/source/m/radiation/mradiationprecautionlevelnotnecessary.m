#import "mradiationprecautionlevelnotnecessary.h"
#import "ecolor.h"

@interface mradiationprecautionlevel ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationprecautionlevelnotnecessary

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_precaution_level_notnecessary", nil);
    self.color = [UIColor main];
    
    return self;
}

@end