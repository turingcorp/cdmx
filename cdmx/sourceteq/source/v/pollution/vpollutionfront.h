#import <UIKit/UIKit.h>
#import "cpollution.h"

@interface vpollutionfront:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cpollution*)controller;

@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)UICollectionView *collection;

@end