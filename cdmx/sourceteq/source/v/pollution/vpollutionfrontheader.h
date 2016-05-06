#import <UIKit/UIKit.h>
#import "vpollutionradiochart.h"
#import "mpollutionreaditem.h"
#import "cpollution.h"

@interface vpollutionfrontheader:UICollectionReusableView

-(void)config:(mpollutionreaditem*)model controller:(cpollution*)controller;

@property(weak, nonatomic)vpollutionradiochart *radiochart;
@property(weak, nonatomic)mpollutionreaditem *model;
@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)UILabel *labeltitle;
@property(weak, nonatomic)UILabel *labelindextitle;
@property(weak, nonatomic)UILabel *labelindexinfo;
@property(weak, nonatomic)NSLayoutConstraint *layoutinfoheight;
@property(strong, nonatomic)NSDictionary *attrinfo;

@end