#import <UIKit/UIKit.h>
#import "mpollutionmapitem.h"

@interface vpollutionmapheader:UIView

-(void)deniedlocation;
-(void)showlocation:(mpollutionmapitem*)model;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UILabel *labeltitle;
@property(weak, nonatomic)UILabel *labelkm;

@end