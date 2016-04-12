#import <UIKit/UIKit.h>
#import "cmenu.h"

@interface vmenu:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cmenu*)controller;

@property(weak, nonatomic)cmenu *controller;
@property(weak, nonatomic)UICollectionView *collection;

@end