#import "mpollutionchart.h"
#import "mpollutionchartitemtoday.h"
#import "mpollutionchartitemweek.h"
#import "mpollutionchartitemmonth.h"

@interface mpollutionchart ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionchartitem*> *items;

@end

@implementation mpollutionchart

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[mpollutionchartitemtoday alloc] init],
                   [[mpollutionchartitemweek alloc] init],
                   [[mpollutionchartitemmonth alloc] init]
                   ];
    self.selected = self.items[0];
    
    return self;
}

@end