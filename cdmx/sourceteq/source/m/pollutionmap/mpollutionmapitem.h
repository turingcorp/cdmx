#import <Foundation/Foundation.h>
#import "mpollutionindex.h"
#import "mpollutionmapitemannotation.h"

@interface mpollutionmapitem:NSObject

-(mpollutionmapitemannotation*)asannotation;

@property(weak, nonatomic)mpollutionmapitemannotation *annotation;
@property(strong, nonatomic)mpollutionindex *index;
@property(copy, nonatomic)NSString *name;
@property(assign, nonatomic)CGFloat latitude;
@property(assign, nonatomic)CGFloat longitude;
@property(assign, nonatomic)CGFloat kilometers;

@end