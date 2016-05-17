#import <UIKit/UIKit.h>

@interface mmenusectionitem:NSObject

-(UIViewController*)controller;

@property(copy, nonatomic, readonly)NSString *name;
@property(copy, nonatomic, readonly)NSString *asset;

@end