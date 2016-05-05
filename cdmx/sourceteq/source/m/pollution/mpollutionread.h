#import <Foundation/Foundation.h>
#import "mpollutionreaditem.h"

@interface mpollutionread:NSObject

+(instancetype)lastread;

@property(strong, nonatomic)NSArray<mpollutionreaditem*> *items;

@end