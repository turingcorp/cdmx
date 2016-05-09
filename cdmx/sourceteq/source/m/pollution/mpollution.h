#import <Foundation/Foundation.h>
#import "mpollutionitem.h"

@interface mpollution:NSObject

+(instancetype)loadfromdb;
-(void)districts;
-(void)daily;

@property(strong, nonatomic, readonly)NSMutableArray<mpollutionitem*> *items;
@property(strong, nonatomic, readonly)NSMutableArray<gspatial*> *spatials;

@end