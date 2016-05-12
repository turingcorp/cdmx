#import <UIKit/UIKit.h>
#import "vpollutionoption.h"
#import "mpollutionchart.h"

@interface vpollutioncharter:vpollutionoption<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)mpollutionchart *model;

@end