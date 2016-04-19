#import <UIKit/UIKit.h>
#import "cabout.h"

@interface vabout:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cabout*)controller;

@property(weak, nonatomic)cabout *controller;

@end