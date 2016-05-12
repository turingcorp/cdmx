#import <Foundation/Foundation.h>
#import "mpollutionoption.h"
#import "mpollutionchartitem.h"

@interface mpollutionchart:mpollutionoption

@property(strong, nonatomic, readonly)NSArray<mpollutionchartitem*> *items;
@property(weak, nonatomic)mpollutionchartitem *selected;

@end