#import <UIKit/UIKit.h>
#import "vpollutionoption.h"
#import "vpollutionmapdisplay.h"
#import "mpollutionmap.h"

@interface vpollutionmap:vpollutionoption<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)mpollutionmap *model;
@property(weak, nonatomic)vpollutionmapdisplay *display;
@property(weak, nonatomic)UICollectionView *collection;

@end