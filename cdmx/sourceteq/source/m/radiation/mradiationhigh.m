#import "mradiationhigh.h"
#import "ecolor.h"

@interface mradiation ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationhigh

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_high", nil);
    self.color = [UIColor pollution_orange];
    
    return self;
}

@end