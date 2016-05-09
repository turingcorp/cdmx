#import <UIKit/UIKit.h>
#import "mpollutionitem.h"

@class cpollution;

@interface vpollutionfront:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cpollution*)controller;
-(void)showdetail;
-(void)showlist;

@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)mpollutionitem *currentitem;
@property(weak, nonatomic)UICollectionView *collection;
@property(strong, nonatomic)UICollectionViewFlowLayout *flowdetail;
@property(strong, nonatomic)UICollectionViewFlowLayout *flowlist;

@end