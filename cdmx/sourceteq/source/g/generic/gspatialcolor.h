#import <Foundation/Foundation.h>
#import "gspatial.h"

@interface gspatialcolor:gspatial

-(instancetype)init:(UIColor*)topleft toprigh:(UIColor*)topright bottomleft:(UIColor*)bottomleft bottomright:(UIColor*)bottomright;

@property(strong, nonatomic)NSMutableData *datacolor;
@property(assign, nonatomic)GLKVector4 *pointercolor;

@end