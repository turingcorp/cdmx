#import <UIKit/UIKit.h>
#import "mstationsannotation.h"

@interface vairgeomapann:MKAnnotationView

-(instancetype)init:(mstationsannotation*)annotation;

@property(weak, nonatomic)mstationsannotation *annotation;

@end