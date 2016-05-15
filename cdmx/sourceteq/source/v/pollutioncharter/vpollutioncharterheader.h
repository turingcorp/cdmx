#import <UIKit/UIKit.h>
#import "mpollutionchart.h"

@interface vpollutioncharterheader:UICollectionReusableView

@property(strong, nonatomic)dispatch_queue_t queue;
@property(weak, nonatomic)mpollutionchart *model;
@property(weak, nonatomic)UILabel *labelindex;
@property(weak, nonatomic)UILabel *labeltitle;
@property(weak, nonatomic)UILabel *labelname;
@property(assign, nonatomic)CGFloat lastx;

@end