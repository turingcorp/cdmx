#import <UIKit/UIKit.h>

@interface mpagesitem:NSObject

-(UIViewController*)controller;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *descr;

@end