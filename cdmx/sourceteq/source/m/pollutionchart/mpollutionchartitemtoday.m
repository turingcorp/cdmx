#import "mpollutionchartitemtoday.h"

@interface mpollutionchartitem ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionchartitempoint*> *points;

@end

@implementation mpollutionchartitemtoday

#pragma mark -
#pragma mark chart item

-(void)loadmodel:(mpollution*)model
{
    NSMutableArray<mpollutionchartitempoint*> *points = [NSMutableArray array];
    NSUInteger counthourly = model.modelhourly.count;
    
    for(NSUInteger indexhourly = 0; indexhourly < counthourly; indexhourly++)
    {
        mpollutionhour *modelhourly = model.modelhourly[indexhourly];
        mpollutionindex *modelindex = [mpollutionindex points:modelhourly.pollution.integerValue];
        NSString *hourtextparam = [NSString stringWithFormat:@"mpollution_item_hourly_%@", modelhourly.hour];
        NSString *hourstring = NSLocalizedString(hourtextparam, nil);
        mpollutionchartitempoint *model = [[mpollutionchartitempoint alloc] init:modelindex name:hourstring];
        [points addObject:model];
    }
    
    self.points = points;
    [super loadmodel:model];
}

@end