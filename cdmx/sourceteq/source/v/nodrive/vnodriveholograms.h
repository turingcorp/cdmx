#import <UIKit/UIKit.h>
#import "mstationsnodrive.h"

@interface vnodriveholograms:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(mstationsnodrive*)model;

@property(weak, nonatomic)mstationsnodrive *model;

@end