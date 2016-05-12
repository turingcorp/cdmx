#import "mpollution.h"
#import "mpollutionfront.h"
#import "mpollutionchart.h"
#import "mdbselect.h"

@interface mpollution ()

@property(strong, nonatomic, readwrite)mpollutionoption *option;
@property(strong, nonatomic, readwrite)NSArray<mdbdistrict*> *modeldistricts;
@property(strong, nonatomic, readwrite)NSArray<mdbpollutiondaily*> *modeldaily;
@property(strong, nonatomic, readwrite)NSArray<mpollutionhour*> *modelhourly;

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
    self.option = [[mpollutionfront alloc] init:self];
}

-(void)chart
{
    self.option = [[mpollutionchart alloc] init:self];
}

-(void)clean
{
    self.option = nil;
}

@end