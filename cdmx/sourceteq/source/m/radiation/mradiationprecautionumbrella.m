#import "mradiationprecautionumbrella.h"

@interface mradiationprecaution ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mradiationprecautionumbrella

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_precaution_umbrella", nil);
    self.asset = @"radiation_exercise";
    
    return self;
}

@end