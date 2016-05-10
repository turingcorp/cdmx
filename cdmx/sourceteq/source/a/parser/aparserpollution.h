#import <Foundation/Foundation.h>
#import "aparser.h"
#import "mpollutionitem.h"

@interface aparserpollution:aparser

@property(strong, nonatomic, readonly)NSArray<mpollutionitem*> *modelhourly;

@end