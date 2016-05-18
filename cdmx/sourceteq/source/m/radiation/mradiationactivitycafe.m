#import "mradiationactivitycafe.h"

@interface mradiationactivity ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationactivitycafe

-(instancetype)init
{
    self = [super init];
    self.asset = @"radiation_cafe";
    self.name = NSLocalizedString(@"mradiation_activity_cafe", nil);
    
    return self;
}

@end