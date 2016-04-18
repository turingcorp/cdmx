#import <UIKit/UIKit.h>
#import "mstationsannotation.h"

@interface vairgeomapann:MKAnnotationView

-(instancetype)init:(mstationsannotation*)annotation;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UILabel *labeltitle;
@property(weak, nonatomic)UILabel *labelindex;

@end