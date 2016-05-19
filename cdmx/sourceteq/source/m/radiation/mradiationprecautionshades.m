#import "mradiationprecautionshades.h"

@interface mradiationprecaution ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mradiationprecautionshades

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_precaution_shades", nil);
    self.asset = @"radiation_shades";
    
    return self;
}

@end