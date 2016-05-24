#import <Foundation/Foundation.h>
#import "mpollutionhour.h"
#import "mdbdistrict.h"
#import "mdbpollutiondaily.h"
#import "mpollutionhour.h"

@class mpollutionoption;

@interface mpollution:NSObject

+(instancetype)loadfromdb:(NSArray<mpollutionhour*>*)modelhourly;
-(void)districts;
-(void)chart;
-(void)map;
-(void)clean;

@property(strong, nonatomic, readonly)mpollutionoption *option;
@property(strong, nonatomic, readonly)NSArray<mdbdistrict*> *modeldistricts;
@property(strong, nonatomic, readonly)NSArray<mdbpollutiondaily*> *modeldaily;
@property(strong, nonatomic, readonly)NSArray<mpollutionhour*> *modelhourly;

@end