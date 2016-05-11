#import <Foundation/Foundation.h>
#import "mpollutionitem.h"

@interface mpollutionitemdaily:mpollutionitem

-(instancetype)init:(mpollutionindex*)index date:(NSNumber*)date spatialx:(CGFloat)spatialx spatialwidth:(CGFloat)spatialwidth;

@end