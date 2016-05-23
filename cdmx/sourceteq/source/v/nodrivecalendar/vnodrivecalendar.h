#import <UIKit/UIKit.h>
#import "vview.h"
#import "mnodrivecalendar.h"

@interface vnodrivecalendar:vview<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)modelcalendar:(mnodrivecalendar*)model;

@property(strong, nonatomic, readonly)mnodrivecalendar *model;
@property(weak, nonatomic)UICollectionView *collection;

@end