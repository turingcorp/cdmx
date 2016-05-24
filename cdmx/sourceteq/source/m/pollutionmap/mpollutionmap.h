#import <UIKit/UIKit.h>
#import "mpollutionoption.h"
#import "mpollutionmapitem.h"

@interface mpollutionmap:mpollutionoption

-(mpollutionmapitem*)closertolat:(CGFloat)lat lon:(CGFloat)lon;
-(NSArray<mpollutionmapitemannotation*>*)annotations;

@property(strong, nonatomic, readonly)NSArray<mpollutionmapitem*> *items;
@property(weak, nonatomic, readonly)NSArray<mpollutionmapitemannotation*> *modelannotations;

@end