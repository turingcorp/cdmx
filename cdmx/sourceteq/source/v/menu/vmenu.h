#import <UIKit/UIKit.h>
#import "cmenu.h"
#import "mpages.h"

@interface vmenu:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cmenu*)controller;

@property(weak, nonatomic)cmenu *controller;
@property(weak, nonatomic)mpages *model;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *layoutbannerheight;

@end