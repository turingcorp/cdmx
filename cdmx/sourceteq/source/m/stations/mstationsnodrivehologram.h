#import <UIKit/UIKit.h>

@interface mstationsnodrivehologram:NSObject

+(instancetype)hologramforstring:(NSString*)rawstring;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *symbol;

@end