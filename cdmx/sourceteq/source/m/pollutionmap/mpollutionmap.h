#import <UIKit/UIKit.h>
#import "mpollutionoption.h"
#import "mpollutionmapitem.h"

@interface mpollutionmap:mpollutionoption

-(mpollutionmapitem*)closertolat:(CGFloat)lat lon:(CGFloat)lon;

@property(strong, nonatomic, readonly)NSArray<mpollutionmapitem*> *items;

@end