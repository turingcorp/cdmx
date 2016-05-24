#import <UIKit/UIKit.h>
#import "mpollutionmapitem.h"

@interface vpollutionmapheader:UICollectionReusableView

-(void)deniedlocation;
-(void)closerstationfound:(mpollutionmapitem*)model;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UILabel *labelindex;
@property(weak, nonatomic)UILabel *labeltitle;
@property(weak, nonatomic)UILabel *labelstation;
@property(weak, nonatomic)UILabel *labelkm;
@property(weak, nonatomic)UIImageView *circle;

@end