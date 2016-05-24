#import <UIKit/UIKit.h>
#import "cnodrive.h"
#import "mnodrivetoday.h"
#import "vspinner.h"

@interface vnodrive:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cnodrive*)controller;
-(void)nodriveloaded:(mnodrivetoday*)model;
-(void)error:(NSString*)error;

@property(weak, nonatomic)cnodrive *controller;
@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)UILabel *labelerror;
@property(weak, nonatomic)UIButton *buttonerror;
@property(strong, nonatomic, readonly)mnodrivetoday *model;

@end