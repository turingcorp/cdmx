#import <UIKit/UIKit.h>
#import "vradiochart.h"
#import "mpollutionindex.h"

@interface vpollutionradiochart:vradiochart

-(void)render:(mpollutionindex*)index;

@property(weak, nonatomic)UILabel *labelpoints;
@property(weak, nonatomic)UILabel *labeltitle;

@end