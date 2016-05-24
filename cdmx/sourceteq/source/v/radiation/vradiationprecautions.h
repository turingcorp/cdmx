#import <UIKit/UIKit.h>
#import "mradiation.h"

@interface vradiationprecautions:UIView<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)update:(mradiation*)model;

@property(weak, nonatomic)mradiation *model;
@property(weak, nonatomic)UICollectionView *collection;

@end