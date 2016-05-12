#import <Foundation/Foundation.h>
#import "gpollutionchartselect.h"
#import "mpollutionchartitempoint.h"

@interface mpollutionchartselect:NSObject

-(instancetype)init:(NSArray<mpollutionchartitempoint*>*)points;
-(void)hideselector;
-(void)newx:(CGFloat)x y:(CGFloat)y;

@property(strong, nonatomic)gpollutionchartselect *spatial;
@property(weak, nonatomic)NSArray<mpollutionchartitempoint*> *points;
@property(weak, nonatomic)mpollutionchartitempoint *current;

@end