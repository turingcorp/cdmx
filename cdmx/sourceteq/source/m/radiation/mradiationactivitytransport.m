#import "mradiationactivitytransport.h"

@interface mradiationactivity ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mradiationactivitytransport

-(instancetype)init
{
    self = [super init];
    self.asset = @"radiation_transport";
    self.name = NSLocalizedString(@"mradiation_activity_transport", nil);
    
    return self;
}

@end