#import "mpollution.h"
#import "mdbselect.h"
#import "ecolor.h"
#import "gpollutionchartbasebottom.h"
#import "gpollutionchartspikes.h"
#import "genericconstants.h"

@interface mpollution ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionitem*> *items;
@property(strong, nonatomic)NSArray *spatials;
@property(strong, nonatomic)NSArray<mdbdistrict*> *modeldistricts;
@property(strong, nonatomic)NSArray<mdbpollutiondaily*> *modeldaily;
@property(strong, nonatomic)NSArray<mpollutionhour*> *modelhourly;

@end

@implementation mpollution

+(instancetype)loadfromdb:(NSArray<mpollutionhour*>*)modelhourly
{
    mpollution *model = [[mpollution alloc] init];
    model.modelhourly = modelhourly;
    model.modeldistricts = [mdbselect district];
    model.modeldaily = [mdbselect pollutiondaily];
    
    return model;
}

#pragma mark public

-(void)districts
{
    [self clean];
    NSMutableArray<mpollutionitem*> *items = [NSMutableArray array];
    
    mpollutionitem *globalitem;
    
    if(self.modelhourly.count)
    {
        globalitem = [mpollutionitem pollutionglobal:[self.modelhourly lastObject].pollution];
    }
    else
    {
        globalitem = [mpollutionitem pollutionglobal:@0];
    }
    
    [items addObject:globalitem];
    
    NSUInteger countdistritcs = self.modeldistricts.count;

    for(NSUInteger indexdistricts = 0; indexdistricts < countdistritcs; indexdistricts++)
    {
        mdbdistrict *district = self.modeldistricts[indexdistricts];
        mpollutionitem *modeldistrict = [mpollutionitem district:district];
        
        [items addObject:modeldistrict];
    }
    
    self.items = items;
}

-(void)chart
{
    [self clean];
    NSMutableArray<mpollutionitem*> *items = [NSMutableArray array];
    NSMutableArray *spatials = [NSMutableArray array];
    
    NSUInteger countdaily = self.modeldaily.count;
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    CGFloat width = screensize.width;
    CGFloat widthperitem = width / (countdaily - 1);
    CGFloat widthsum = 0;
    
    gpollutionchartbasebottom *basebottom = [[gpollutionchartbasebottom alloc] init:width];
    gpollutionchartspikes *spikes = [[gpollutionchartspikes alloc] init:[[UIColor main] colorWithAlphaComponent:0.2] bottom:[[UIColor main] colorWithAlphaComponent:0.05]];
    
    [spatials addObject:basebottom];
    [spatials addObject:spikes];
    
    for(NSUInteger indexdaily = 0; indexdaily < countdaily; indexdaily++)
    {
        mdbpollutiondaily *daily = self.modeldaily[indexdaily];
        mpollutionitem *modeldaily = [mpollutionitem pollutiondaily:daily spatialx:widthsum spatialwidth:widthperitem];
        [items addObject:modeldaily];
        
        mpollutionchartspike *spike = [[mpollutionchartspike alloc] init];
        spike.x = widthsum;
        spike.y = pollution_drawableheight - modeldaily.index.points;
        [spikes add:spike];
        
        widthsum += widthperitem;
    }
    
    [spikes render];
    
    self.items = items;
    self.spatials = spatials;
}

-(void)clean
{
    self.items = nil;
    self.spatials = nil;
}

-(void)highlight:(mpollutionitem*)model
{
    BOOL makestandby = model.makesstandby;
    
    for(mpollutionitem *item in self.items)
    {
        if(makestandby)
        {
            [item standby];
        }
        else
        {
            if(item == model)
            {
                [item turnon];
            }
            else
            {
                [item turnoff];
            }
        }
    }
}

@end