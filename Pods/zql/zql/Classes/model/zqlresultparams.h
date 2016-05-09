#import <Foundation/Foundation.h>
#import "zqlparam.h"

@interface zqlresultparams:NSObject

-(void)add:(zqlparam*)param;

@property(strong, nonatomic, readonly)NSMutableDictionary<NSString*, zqlparam*> *items;

@end