#import "mradiation.h"
#import "mradiationnone.h"
#import "mradiationlow.h"
#import "mradiationmid.h"
#import "mradiationhigh.h"
#import "mradiationveryhigh.h"
#import "mradiationextreme.h"

static NSInteger const radiationthresholdlow = 1;
static NSInteger const radiationthresholdmid = 3;
static NSInteger const radiationthresholdhigh = 6;
static NSInteger const radiationthresholdveryhigh = 8;
static NSInteger const radiationthresholdextreme = 11;

@interface mradiation ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;
@property(assign, nonatomic, readwrite)NSInteger points;

@end

@implementation mradiation

+(instancetype)points:(NSInteger)points
{
    mradiation *model;
    
    if(points < radiationthresholdlow)
    {
        model = [[mradiationnone alloc] init:points];
    }
    else if(points < radiationthresholdmid)
    {
        model = [[mradiationlow alloc] init:points];
    }
    else if(points < radiationthresholdhigh)
    {
        model = [[mradiationmid alloc] init:points];
    }
    else if(points < radiationthresholdveryhigh)
    {
        model = [[mradiationhigh alloc] init:points];
    }
    else if(points < radiationthresholdextreme)
    {
        model = [[mradiationveryhigh alloc] init:points];
    }
    else
    {
        model = [[mradiationextreme alloc] init:points];
    }
    
    return model;
}

+(NSInteger)maxpoints
{
    return radiationthresholdextreme;
}

-(instancetype)init:(NSInteger)points
{
    self = [self init];
    self.points = points;
    
    return self;
}

-(NSString*)description
{
    NSString *string = [NSString stringWithFormat:@"%@", @(self.points)];
    
    return string;
}

@end