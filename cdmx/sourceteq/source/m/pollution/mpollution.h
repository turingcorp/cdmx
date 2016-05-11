#import <Foundation/Foundation.h>
#import "mpollutionitem.h"
#import "mpollutionhour.h"

@interface mpollution:NSObject

+(instancetype)loadfromdb:(NSArray<mpollutionhour*>*)modelhourly;
-(void)districts;
-(void)chart;
-(void)clean;
-(void)highlight:(mpollutionitem*)model;

@property(strong, nonatomic, readonly)NSArray<mpollutionitem*> *items;

@end