#import <UIKit/UIKit.h>
#import "vview.h"

@interface vradiationabout:vview<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)viewdidappear;

@property(weak, nonatomic)UICollectionView *collection;

@end