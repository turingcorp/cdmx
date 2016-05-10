#import "mpollution.h"
#import "mdbselect.h"

@interface mpollution ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionitem*> *items;
@property(strong, nonatomic, readwrite)NSMutableArray<gspatial*> *spatials;
@property(strong, nonatomic)NSArray<mdbdistrict*> *modeldistricts;
@property(strong, nonatomic)NSArray<mdbpollutiondaily*> *modeldaily;
@property(strong, nonatomic)NSArray<mpollutionitem*> *modelhourly;

@end

@implementation mpollution

+(instancetype)loadfromdb
{
    mpollution *model = [[mpollution alloc] init];
    model.modeldistricts = [mdbselect district];
    model.modeldaily = [mdbselect pollutiondaily];
    
    return model;
}

#pragma mark public

-(void)districts
{
    [self clean];
    self.spatials = [NSMutableArray array];
    
    NSUInteger countdistritcs = self.modeldistricts.count;
    
    mpollutionitem *globalitem = [mpollutionitem pollutionglobal:self.modeldaily[0]];
    [self.items addObject:globalitem];
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistritcs; indexdistricts++)
    {
        mdbdistrict *district = self.modeldistricts[indexdistricts];
        mpollutionitem *modeldistrict = [mpollutionitem district:district];
        
        [self.items addObject:modeldistrict];
        [self.spatials addObject:modeldistrict.spatial];
    }
}

-(void)daily
{
    [self clean];
    
    NSUInteger countdaily = self.modeldaily.count;
    
    for(NSUInteger indexdaily = 0; indexdaily < countdaily; indexdaily++)
    {
        mdbpollutiondaily *daily = self.modeldaily[indexdaily];
        mpollutionitem *modeldaily = [mpollutionitem pollutiondaily:daily];
        
        [self.items addObject:modeldaily];
    }
}

-(void)clean
{
    self.items = [NSMutableArray array];
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