#import "mradiationlow.h"
#import "ecolor.h"

@interface mradiation ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationlow

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_low", nil);
    self.color = [UIColor pollution_green];
    
    return self;
}

@end