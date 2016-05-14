#import <UIKit/UIKit.h>
#import "mpollutionoption.h"
#import "mpollutionmapitem.h"

@interface mpollutionmap:mpollutionoption

-(mpollutionmapitem*)closertolat:(CGFloat)lat lon:(CGFloat)lon;
-(void)annotations;

@property(strong, nonatomic, readonly)NSArray<mpollutionmapitem*> *items;

@end