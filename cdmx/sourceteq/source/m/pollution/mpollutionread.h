#import <Foundation/Foundation.h>
#import "mpollutionreaditem.h"

@interface mpollutionread:NSObject

+(instancetype)load;
+(instancetype)lastread;

@property(strong, nonatomic, readonly)NSMutableArray<mpollutionreaditem*> *items;

@end