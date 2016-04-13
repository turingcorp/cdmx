#import <UIKit/UIKit.h>
#import "mstationsreadinguvindex.h"

@interface mstationsreadinguv:NSObject

-(instancetype)init:(NSInteger)index title:(NSString*)title descr:(NSString*)descr;

@property(strong, nonatomic)mstationsreadinguvindex *index;
@property(copy, nonatomic)NSString *title;
@property(copy, nonatomic)NSString *descr;

@end