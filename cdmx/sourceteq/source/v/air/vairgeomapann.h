#import <UIKit/UIKit.h>
#import "mstationsannotation.h"

@interface vairgeomapann:MKAnnotationView

-(instancetype)init:(mstationsannotation*)annotation;

@property(strong, nonatomic)mstationsannotation *annotation;
@property(weak, nonatomic)UIImageView *img;
@property(weak, nonatomic)UIImageView *stick;
@property(weak, nonatomic)UILabel *labeltitle;
@property(weak, nonatomic)UILabel *labelindex;

@end