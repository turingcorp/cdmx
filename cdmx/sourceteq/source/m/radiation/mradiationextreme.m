#import "mradiationextreme.h"
#import "ecolor.h"

@interface mradiation ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationextreme

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_extreme", nil);
    
    return self;
}

@end