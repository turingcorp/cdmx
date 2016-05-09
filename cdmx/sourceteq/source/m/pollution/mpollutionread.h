#import <Foundation/Foundation.h>
#import "mpollutionreaditem.h"

@interface mpollutionread:NSObject

+(instancetype)load;
+(instancetype)lastread;

@property(strong, nonatomic)NSMutableArray<mpollutionreaditem*> *items;
@property()

@end