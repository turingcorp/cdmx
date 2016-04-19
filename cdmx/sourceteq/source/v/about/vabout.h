#import <UIKit/UIKit.h>
#import "cabout.h"
#import "mabout.h"

@interface vabout:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cabout*)controller;

@property(weak, nonatomic)cabout *controller;
@property(strong, nonatomic)mabout *model;

@end