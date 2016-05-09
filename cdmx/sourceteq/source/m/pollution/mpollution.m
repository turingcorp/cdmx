#import "mpollution.h"
#import "mdbselect.h"

@interface mpollution ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionitem*> *items;
@property(strong, nonatomic)NSArray<mdbdistrict*> *modeldistricts;
@property(strong, nonatomic)NSArray<mdbpollutiondaily*> *modeldaily;

@end

@implementation mpollution

+(instancetype)load
{
    mpollution *model = [[mpollution alloc] init];
    model.modeldistricts = [mdbselect district];
    model.modeldaily = [mdbselect pollutiondaily];
    
    return model;
}

#pragma mark public

-(void)distritcs
{
    self.items = [NSMutableArray array];
}

-(void)daily
{
    self.items = [NSMutableArray array];
}

@end