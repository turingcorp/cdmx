#import <UIKit/UIKit.h>
#import "vview.h"
#import "mradiationabout.h"

@interface vradiationabout:vview<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)viewdidappear;

@property(weak, nonatomic)UICollectionView *collection;
@property(strong, nonatomic, readonly)mradiationabout *model;

@end