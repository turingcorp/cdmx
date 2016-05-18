#import "mradiationmid.h"
#import "ecolor.h"

@interface mradiation ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationmid

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_mid", nil);
    self.color = [UIColor pollution_yellow];
    
    return self;
}

@end