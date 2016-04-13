#import <UIKit/UIKit.h>
#import "mstationsreadingitem.h"

@interface mstationsreading:NSObject

@property(strong, nonatomic)NSArray<mstationsreadingitem*> *items;
@property(strong, nonatomic)NSDate *date;
@property(nonatomic)NSInteger hour;

@end