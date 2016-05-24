#import <Foundation/Foundation.h>
#import "aparser.h"
#import "mpollutionhour.h"

@interface aparserpollution:aparser

@property(strong, nonatomic, readonly)NSArray<mpollutionhour*> *modelhourly;

@end