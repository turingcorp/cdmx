#import <UIKit/UIKit.h>
#import "cpollution.h"
#import "mpollutionread.h"

@interface vpollutionfront:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cpollution*)controller;
-(void)showdetail;
-(void)showlist;

@property(strong, nonatomic)mpollutionread *model;
@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)mpollutionreaditem *currentreaditem;
@property(weak, nonatomic)UICollectionView *collection;

@end