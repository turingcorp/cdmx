#import <Foundation/Foundation.h>
#import "mpollutionchartitem.h"

@interface mpollutionchart:NSObject

@property(strong, nonatomic, readonly)NSArray<mpollutionchartitem*> *items;
@property(weak, nonatomic)mpollutionchartitem *selected;

@end