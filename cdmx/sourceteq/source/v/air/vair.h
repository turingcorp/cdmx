#import "appdel.h"
#import "cair.h"
#import "mstationsreading.h"

@interface vair:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cair*)controller;

@property(weak, nonatomic)cair *controller;
@property(weak, nonatomic)mstationsreading *lastreading;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *layoutmapheight;

@end