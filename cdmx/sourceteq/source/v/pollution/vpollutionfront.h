#import <UIKit/UIKit.h>
#import "mpollutionitem.h"
#import "vpollutionfrontlayoutdetail.h"
#import "vpollutionfrontlayoutlist.h"

@class cpollution;

@interface vpollutionfront:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cpollution*)controller;
-(void)showdetail;
-(void)showlist;

@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)mpollutionitem *currentitem;
@property(weak, nonatomic)UICollectionView *collection;
@property(strong, nonatomic)vpollutionfrontlayoutdetail *flowdetail;
@property(strong, nonatomic)vpollutionfrontlayoutlist *flowlist;

@end