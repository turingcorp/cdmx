#import <UIKit/UIKit.h>
#import "vview.h"

@interface vpollutionpollutants:vview<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end