#import <UIKit/UIKit.h>
#import "cnodrive.h"
#import "mnodrivetoday.h"

@interface vnodrive:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cnodrive*)controller;
-(void)nodriveloaded:(mnodrivetoday*)model;

@property(weak, nonatomic)cnodrive *controller;
@property(weak, nonatomic)UICollectionView *collection;
@property(strong, nonatomic, readonly)mnodrivetoday *model;

@end