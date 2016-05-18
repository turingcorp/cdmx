#import "mradiationveryhigh.h"
#import "ecolor.h"

@interface mradiation ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationveryhigh

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_veryhigh", nil);
    self.color = [UIColor pollution_red];
    
    return self;
}

@end