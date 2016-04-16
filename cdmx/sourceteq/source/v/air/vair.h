#import "appdel.h"
#import "cair.h"
#import "mstationsreading.h"
#import "vairbar.h"
#import "vairmap.h"

@interface vair:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cair*)controller;
-(void)viewappear;
-(void)retry;

@property(weak, nonatomic)cair *controller;
@property(weak, nonatomic)mstationsreading *lastreading;
@property(weak, nonatomic)vairbar *bar;
@property(weak, nonatomic)vairmap *map;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;
@property(weak, nonatomic)NSLayoutConstraint *layoutmapheight;
@property(copy, nonatomic)NSString *error;

@end