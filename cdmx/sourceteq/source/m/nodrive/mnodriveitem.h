#import <Foundation/Foundation.h>
#import "mnodriveitemplate.h"

@interface mnodriveitem:NSObject

@property(strong, nonatomic, readonly)NSArray<mnodriveitemplate*> *plates;
@property(assign, nonatomic, readonly)BOOL permit;

@end