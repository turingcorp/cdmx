#import <Foundation/Foundation.h>
#import "gspatialcolor.h"
#import "mpollutionindex.h"

@interface gpollutionchartbar:gspatialcolor

-(instancetype)init:(mpollutionindex*)index x:(CGFloat)x width:(CGFloat)width;

@end