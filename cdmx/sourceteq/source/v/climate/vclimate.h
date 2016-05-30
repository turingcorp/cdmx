#import <UIKit/UIKit.h>
#import "cclimate.h"
#import "vspinner.h"
#import "mclimatecurrent.h"

@interface vclimate:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cclimate*)controller;
-(void)climateloaded:(mclimatecurrent*)model;
-(void)error:(NSString*)error;

@property(strong, nonatomic, readonly)mclimatecurrent *model;
@property(weak, nonatomic, readonly)cclimate *controller;
@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)UILabel *labelerror;
@property(weak, nonatomic)UIButton *buttonerror;

@end