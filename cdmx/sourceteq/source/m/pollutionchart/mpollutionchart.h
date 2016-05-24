#import <UIKit/UIKit.h>
#import "mpollutionoption.h"
#import "mpollutionchartitem.h"

@interface mpollutionchart:mpollutionoption

-(void)changeselected:(mpollutionchartitem*)selected;

@property(strong, nonatomic, readonly)NSArray<mpollutionchartitem*> *items;
@property(weak, nonatomic)mpollution *model;
@property(weak, nonatomic)mpollutionchartitem *selected;

@end