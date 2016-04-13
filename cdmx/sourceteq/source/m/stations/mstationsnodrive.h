#import <UIKit/UIKit.h>
#import "mstationsnodrivehologram.h"
#import "mstationsnodriveplate.h"

@interface mstationsnodrive:NSObject

@property(strong, nonatomic)NSArray<mstationsnodrivehologram*> *holograms;
@property(strong, nonatomic)NSArray<mstationsnodriveplate*> *plates;
@property(strong, nonatomic)NSDate *date;

@end