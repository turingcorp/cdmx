#import "mpollution.h"
#import "mdbselect.h"

@interface mpollution ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionitem*> *items;
@property(strong, nonatomic, readwrite)NSArray<gspatial*> *spatials;
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
    NSMutableArray<gspatial*> *spatials = [NSMutableArray array];
    
    mpollutionitem *globalitem;
    
    if(self.modelhourly.count)
    {
        globalitem = [mpollutionitem pollutionglobal:self.modelhourly[0].pollution];
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
        [spatials addObject:modeldistrict.spatial];
    }
    
    self.items = items;
    self.spatials = spatials;
}

-(void)chart
{
    [self clean];
    NSMutableArray<mpollutionitem*> *items = [NSMutableArray array];
    NSMutableArray<gspatial*> *spatials = [NSMutableArray array];
    
    NSUInteger countdaily = self.modeldaily.count;
    
    for(NSUInteger indexdaily = 0; indexdaily < countdaily; indexdaily++)
    {
        mdbpollutiondaily *daily = self.modeldaily[indexdaily];
        mpollutionitem *modeldaily = [mpollutionitem pollutiondaily:daily];
        
        [items addObject:modeldaily];
    }
    
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