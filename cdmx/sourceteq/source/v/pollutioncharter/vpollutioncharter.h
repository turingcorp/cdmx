#import <UIKit/UIKit.h>
#import "vpollutionoption.h"

@interface vpollutioncharter:vpollutionoption<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end