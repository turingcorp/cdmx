#import <Foundation/Foundation.h>
#import "mpollutionitem.h"

@interface mpollution:NSObject

+(instancetype)load;
-(void)distritcs;
-(void)daily;

@property(strong, nonatomic, readonly)NSMutableArray<mpollutionitem*> *items;

@end