#import <UIKit/UIKit.h>
#import "vpollutionoption.h"
#import "vpollutionmapdisplay.h"

@interface vpollutionmap:vpollutionoption<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)vpollutionmapdisplay *display;
@property(weak, nonatomic)UICollectionView *collection;

@end