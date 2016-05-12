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
    self.modelselect = [[mpollutionchartselect alloc] init];
    self.items = @[
                   [[mpollutionchartitemtoday alloc] init],
                   [[mpollutionchartitemweek alloc] init],
                   [[mpollutionchartitemmonth alloc] init]
                   ];
    
    [self changeselected:self.items[0]];
    
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