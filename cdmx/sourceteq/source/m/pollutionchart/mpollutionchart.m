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
    
    
    
    [self clean];
    NSMutableArray<mpollutionitem*> *items = [NSMutableArray array];
    NSMutableArray *spatials = [NSMutableArray array];
    
    NSUInteger countdaily = self.modeldaily.count;
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    CGFloat width = screensize.width;
    CGFloat widthperitem = width / (countdaily - 1);
    CGFloat widthsum = 0;
    
    gpollutionchartbasebottom *basebottom = [[gpollutionchartbasebottom alloc] init:width];
    gpollutionchartspikes *spikes = [[gpollutionchartspikes alloc] init];
    gpollutionchartline *line = [[gpollutionchartline alloc] init];
    gpollutionchartselect *chartselect = [[gpollutionchartselect alloc] init];
    
    //    [spatials addObject:basebottom];
    [spatials addObject:spikes];
    [spatials addObject:line];
    [spatials addObject:chartselect];
    
    for(NSUInteger indexdaily = 0; indexdaily < countdaily; indexdaily++)
    {
        mdbpollutiondaily *daily = self.modeldaily[indexdaily];
        mpollutionitem *modeldaily = [mpollutionitem pollutiondaily:daily spatialx:widthsum spatialwidth:widthperitem];
        [items addObject:modeldaily];
        
        mpollutionchartspike *spike = [[mpollutionchartspike alloc] init];
        spike.color = modeldaily.index.color;
        spike.x = widthsum;
        spike.y = pollution_drawableheight - modeldaily.index.points;
        
        [spikes add:spike];
        [line add:spike];
        
        widthsum += widthperitem;
    }
    
    [spikes render];
    [line render];
    
    self.items = items;
    self.spatials = spatials;
    
    
    self.items = @[
                   [[mpollutionchartitemtoday alloc] init],
                   [[mpollutionchartitemweek alloc] init],
                   [[mpollutionchartitemmonth alloc] init]
                   ];
    self.selected = self.items[0];
    
    return self;
}

@end