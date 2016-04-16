#import <UIKit/UIKit.h>
#import "mstationsreadingitem.h"

@interface mcdmapitem:NSObject

@property(weak, nonatomic)mstationsreadingitem *readingmodel;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;

@end