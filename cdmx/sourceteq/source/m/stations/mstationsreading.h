#import <UIKit/UIKit.h>
#import "mstationsreadingitem.h"
#import "mstationsreadinguv.h"

@interface mstationsreading:NSObject

@property(strong, nonatomic)mstationsreadinguv *uv;
@property(strong, nonatomic)NSArray<mstationsreadingitem*> *items;

@end