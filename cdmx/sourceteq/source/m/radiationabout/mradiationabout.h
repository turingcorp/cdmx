#import <Foundation/Foundation.h>
#import "mradiationaboutsection.h"

@interface mradiationabout:NSObject

+(instancetype)model;

@property(strong, nonatomic, readonly)NSArray<mradiationaboutsection*> *sections;

@end