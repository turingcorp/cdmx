#import <UIKit/UIKit.h>
#import "vpollutionoption.h"
#import "mpollutionfront.h"
#import "vpollutionfrontlayout.h"

@interface vpollutionfront:vpollutionoption<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)showdetail:(BOOL)update;
-(void)showlist;

@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)mpollutionfront *model;
@property(weak, nonatomic)mpollutionfrontitem *currentitem;
@property(weak, nonatomic)vpollutionfrontlayout *layout;

@end