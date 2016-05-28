#import <UIKit/UIKit.h>
#import "cclimate.h"
#import "vspinner.h"

@interface vclimate:UIView

-(instancetype)init:(cclimate*)controller;
-(void)climateloaded;
-(void)error:(NSString*)error;

@property(weak, nonatomic, readonly)cclimate *controller;
@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)UILabel *labelerror;
@property(weak, nonatomic)UIButton *buttonerror;

@end