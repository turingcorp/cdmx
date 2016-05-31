#import <UIKit/UIKit.h>

@interface vecobicimenu:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end