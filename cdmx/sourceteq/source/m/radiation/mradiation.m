#import "mradiation.h"
#import "mradiationnone.h"
#import "mradiationlow.h"
#import "mradiationmid.h"
#import "mradiationhigh.h"
#import "mradiationveryhigh.h"
#import "mradiationextreme.h"

@interface mradiation ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;
@property(assign, nonatomic, readwrite)NSInteger points;

@end

@implementation mradiation

+(instancetype)points:(NSInteger)points
{
    mradiation *model;
    
    return model;
}

@end