#import <UIKit/UIKit.h>
#import "vpollutionoption.h"
#import "mpollutionfront.h"

@interface vpollutionfront:vpollutionoption<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)showdetail;
-(void)showlist;

@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)mpollutionfront *model;
@property(weak, nonatomic)mpollutionfrontitem *currentitem;
@property(strong, nonatomic)vpollutionfrontlayoutdetail *flowdetail;
@property(strong, nonatomic)vpollutionfrontlayoutlist *flowlist;

@end