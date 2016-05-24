#import <Foundation/Foundation.h>
#import "mmenusection.h"

@interface mmenu:NSObject

@property(strong, nonatomic, readonly)NSArray<mmenusection*> *sections;

@end