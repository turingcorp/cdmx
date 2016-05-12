#import <UIKit/UIKit.h>
#import "vpollutionoption.h"
#import "mpollutionitem.h"
#import "vpollutionfrontlayoutdetail.h"
#import "vpollutionfrontlayoutlist.h"

@interface vpollutionfront:vpollutionoption<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)showdetail;
-(void)showlist;

@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)mpollutionitem *currentitem;
@property(strong, nonatomic)vpollutionfrontlayoutdetail *flowdetail;
@property(strong, nonatomic)vpollutionfrontlayoutlist *flowlist;

@end