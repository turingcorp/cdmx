#import "mpollutionchartitemmonth.h"
#import "tools.h"

static NSInteger const chartmaxdaysmonth = 30;

@interface mpollutionchartitem ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionchartitempoint*> *points;

@end

@implementation mpollutionchartitemmonth

-(instancetype)init:(NSString*)name
{
    self = [super init:NSLocalizedString(@"mpollution_chart_month", nil)];
    
    return self;
}

#pragma mark -
#pragma mark chart item

-(void)loadmodel:(mpollution*)model
{
    NSMutableArray<mpollutionchartitempoint*> *points = [NSMutableArray array];
    NSInteger countdaily = model.modeldaily.count;
    NSInteger indexdaily = countdaily - chartmaxdaysmonth;
    
    if(indexdaily < 0)
    {
        indexdaily = 0;
    }
    
    for(;indexdaily < countdaily; indexdaily++)
    {
        mdbpollutiondaily *modeldaily = model.modeldaily[indexdaily];
        mpollutionindex *modelindex = [mpollutionindex points:modeldaily.pollution.integerValue];
        NSString *datestring = [[tools singleton] datefromserver:modeldaily.date];
        mpollutionchartitempoint *model = [[mpollutionchartitempoint alloc] init:modelindex name:datestring];
        [points addObject:model];
    }
    
    self.points = points;
    [super loadmodel:model];
}

@end