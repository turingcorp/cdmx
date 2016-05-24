#import "mpollutionchart.h"
#import "mpollutionchartitemtoday.h"
#import "mpollutionchartitemweek.h"
#import "mpollutionchartitemmonth.h"

@interface mpollutionchart ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionchartitem*> *items;

@end

@implementation mpollutionchart

-(instancetype)init:(mpollution*)model
{
    self = [super init:model];
    self.model = model;
    self.items = @[
                   [[mpollutionchartitemtoday alloc] init],
                   [[mpollutionchartitemweek alloc] init],
                   [[mpollutionchartitemmonth alloc] init]
                   ];
    
    return self;
}

#pragma mark public

-(void)changeselected:(mpollutionchartitem*)selected;
{
    [self.selected clean];
    self.selected = selected;
    [selected loadmodel:self.model];
}

@end