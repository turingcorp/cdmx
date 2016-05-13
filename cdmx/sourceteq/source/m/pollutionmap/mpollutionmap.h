#import <Foundation/Foundation.h>
#import "mpollutionoption.h"
#import "mpollutionmapitem.h"

@interface mpollutionmap:mpollutionoption

@property(strong, nonatomic, readonly)NSArray<mpollutionmapitem*> *items;
@property(weak, nonatomic)mpollutionmapitem *closeritem;

@end