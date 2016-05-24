#import "mradiationprecautionsunscreen.h"

@interface mradiationprecaution ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mradiationprecautionsunscreen

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_precaution_sunscreen", nil);
    self.asset = @"radiation_sunscreen";
    
    return self;
}

@end