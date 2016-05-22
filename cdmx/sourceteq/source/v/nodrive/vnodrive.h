#import <UIKit/UIKit.h>
#import "cnodrive.h"
#import "mnodrive.h"

@interface vnodrive:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cnodrive*)controller;
-(void)nodriveloaded:(mnodrive*)model;

@property(weak, nonatomic)cnodrive *controller;
@property(weak, nonatomic)UICollectionView *collection;
@property(strong, nonatomic, readonly)mnodrive *model;

@end