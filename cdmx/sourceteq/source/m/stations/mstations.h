#import <Foundation/Foundation.h>
#import "mstationsitem.h"

@interface mstations:NSObject

+(instancetype)singleton;
-(void)load;

@property(strong, nonatomic)NSArray<mstationsitem*> *items;
@property(nonatomic)BOOL loaded;

@end