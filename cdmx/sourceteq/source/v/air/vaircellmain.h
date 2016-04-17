#import <UIKit/UIKit.h>

@interface vaircellmain:UICollectionViewCell<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)config;

@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UILabel *labeltemp;
@property(weak, nonatomic)UILabel *labelhumidity;
@property(weak, nonatomic)UILabel *labeluvindex;
@property(weak, nonatomic)UILabel *labelindex;
@property(weak, nonatomic)UILabel *labelindexname;
@property(weak, nonatomic)UIView *baseindex;
@property(weak, nonatomic)NSLayoutConstraint *layoutlabeltop;
@property(weak, nonatomic)NSLayoutConstraint *layoutlabelheight;

@end