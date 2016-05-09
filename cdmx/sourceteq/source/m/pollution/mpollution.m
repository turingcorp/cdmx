#import "mpollution.h"
#import "mdbselect.h"

@interface mpollution ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionitem*> *items;
@property(strong, nonatomic)NSArray<mdbdistrict*> *modeldistricts;
@property(strong, nonatomic)NSArray<mdbpollutiondaily*> *modeldaily;

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
    self.items = [NSMutableArray array];
    
    NSUInteger countdistritcs = self.modeldistricts.count;
    
    mpollutionitem *globalitem = [mpollutionitem pollutiondaily:self.modeldaily[0]];
    [self.items addObject:globalitem];
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistritcs; indexdistricts++)
    {
        mdbdistrict *district = self.modeldistricts[indexdistricts];
        mpollutionitem *modeldistrict = [mpollutionitem district:district];
        
        [self.items addObject:modeldistrict];
    }
}

-(void)daily
{
    self.items = [NSMutableArray array];
    
    NSUInteger countdaily = self.modeldaily.count;
    
    for(NSUInteger indexdaily = 0; indexdaily < countdaily; indexdaily++)
    {
        mdbpollutiondaily *daily = self.modeldaily[indexdaily];
        mpollutionitem *modeldaily = [mpollutionitem pollutiondaily:daily];
        
        [self.items addObject:modeldaily];
    }
}

@end