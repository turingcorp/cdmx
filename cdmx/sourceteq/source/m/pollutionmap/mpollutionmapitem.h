#import <Foundation/Foundation.h>
#import "mpollutionindex.h"

@interface mpollutionmapitem:NSObject

@property(strong, nonatomic)mpollutionindex *index;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSNumber *latitude;
@property(copy, nonatomic)NSNumber *longitude;

@end