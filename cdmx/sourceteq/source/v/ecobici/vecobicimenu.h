#import <UIKit/UIKit.h>
#import "mecobicimenu.h"
#import "cecobici.h"

@interface vecobicimenu:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cecobici*)controller;

@property(weak, nonatomic, readonly)UICollectionView *collection;
@property(weak, nonatomic, readonly)cecobici *controller;
@property(strong, nonatomic, readonly)mecobicimenu *model;

@end