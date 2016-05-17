#import <UIKit/UIKit.h>
#import "vview.h"

@interface vmenu:vview<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end