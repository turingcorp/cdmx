#import <Foundation/Foundation.h>
#import "aparser.h"
#import "mclimate.h"

@interface aparserclimate:aparser

@property(strong, nonatomic, readonly)mclimate *climate;

@end