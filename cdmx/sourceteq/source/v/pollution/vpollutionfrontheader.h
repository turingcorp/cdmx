#import <UIKit/UIKit.h>
#import "vpollutionradiochart.h"
#import "cpollution.h"
#import "vpollutionfrontheadercurrent.h"

@interface vpollutionfrontheader:UICollectionReusableView

-(void)config:(mpollutionitem*)model controller:(cpollution*)controller;

@property(weak, nonatomic)vpollutionradiochart *radiochart;
@property(weak, nonatomic)mpollutionitem *model;
@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)vpollutionfrontheadercurrent *current;
@property(weak, nonatomic)UILabel *labelindextitle;
@property(weak, nonatomic)UILabel *labelindexinfo;
@property(weak, nonatomic)NSLayoutConstraint *layoutinfoheight;
@property(strong, nonatomic)NSDictionary *attrinfo;

@end