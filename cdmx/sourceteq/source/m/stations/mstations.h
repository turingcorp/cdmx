#import <Foundation/Foundation.h>
#import "mstationsitem.h"

@interface mstations:NSObject

+(instancetype)singleton;
-(void)load;

@property(strong, nonatomic)NSMutableArray<mstationsitem*> *items;

@end