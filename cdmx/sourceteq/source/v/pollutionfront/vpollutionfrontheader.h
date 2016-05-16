#import <UIKit/UIKit.h>
#import "vpollutionradiochart.h"
#import "cpollution.h"
#import "vpollutionfrontheadercurrent.h"
#import "mpollutionfrontitem.h"

@interface vpollutionfrontheader:UICollectionReusableView

-(void)config:(mpollutionfrontitem*)model controller:(cpollution*)controller;

@property(weak, nonatomic)vpollutionradiochart *radiochart;
@property(weak, nonatomic)mpollutionfrontitem *model;
@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)vpollutionfrontheadercurrent *current;
@property(weak, nonatomic)UILabel *labelpollutanttitle;
@property(weak, nonatomic)UILabel *labelpollutant;

@end