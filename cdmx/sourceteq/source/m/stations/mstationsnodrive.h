#import <UIKit/UIKit.h>
#import "mstationsnodrivehologram.h"
#import "mstationsnodrivecolor.h"
#import "mstationsnodriveplate.h"

@interface mstationsnodrive:NSObject

@property(strong, nonatomic)NSArray<mstationsnodrivehologram*> *holograms;
@property(strong, nonatomic)NSArray<mstationsnodrivecolor*> *colors;
@property(strong, nonatomic)NSArray<mstationsnodriveplate*> *plates;
@property(strong, nonatomic)NSDate *date;

@end