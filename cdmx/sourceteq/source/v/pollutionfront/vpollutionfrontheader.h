#import <UIKit/UIKit.h>
#import "vpollutionradiochart.h"
#import "cpollution.h"
#import "vpollutionfrontheadercurrent.h"
#import "mpollutionfrontitem.h"

@interface vpollutionfrontheader:UICollectionReusableView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)config:(mpollutionfrontitem*)model controller:(cpollution*)controller;

@property(strong, nonatomic)NSArray<mpollutionfrontitemoption*> *options;
@property(weak, nonatomic)vpollutionradiochart *radiochart;
@property(weak, nonatomic)mpollutionfrontitem *model;
@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)vpollutionfrontheadercurrent *current;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)UILabel *labelpollutanttitle;
@property(weak, nonatomic)UILabel *labelpollutant;
@property(weak, nonatomic)NSLayoutConstraint *layoutcollectionheight;

@end