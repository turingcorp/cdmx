#import <UIKit/UIKit.h>
#import "vpollutionradiochart.h"
#import "mpollutionreaditem.h"

@interface vpollutionfrontheader:UICollectionReusableView

-(void)config:(mpollutionreaditem*)model;

@property(weak, nonatomic)vpollutionradiochart *radiochart;
@property(weak, nonatomic)UILabel *labeltitle;
@property(weak, nonatomic)mpollutionreaditem *model;

@end