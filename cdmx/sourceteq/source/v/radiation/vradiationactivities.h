#import <UIKit/UIKit.h>
#import "mradiation.h"

@interface vradiationactivities:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)update:(mradiation*)model;

@property(weak, nonatomic)mradiation *model;
@property(weak, nonatomic)UICollectionView *collection;

@end