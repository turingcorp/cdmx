#import <Foundation/Foundation.h>
#import "mpollutionitem.h"

@interface mpollution:NSObject

+(instancetype)loadfromdb;
-(void)districts;
-(void)daily;
-(void)clean;
-(void)highlight:(mpollutionitem*)model;

@property(strong, nonatomic, readonly)NSArray<mpollutionitem*> *items;
@property(strong, nonatomic, readonly)NSArray<gspatial*> *spatials;

@end