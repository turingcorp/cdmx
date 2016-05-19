#import <UIKit/UIKit.h>
#import "vview.h"

@interface vradiationabout:vview<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end