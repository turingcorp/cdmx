#import "appdel.h"
#import "cair.h"

@interface vair:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cair*)controller;

@property(weak, nonatomic)cair *controller;
@property(weak, nonatomic)UICollectionView *collection;

@end