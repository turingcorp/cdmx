#import <UIKit/UIKit.h>
#import "mecobiciitemannotation.h"

@interface mecobiciitem:NSObject

-(mecobiciitemannotation*)asannotation;

@property(weak, nonatomic)mecobiciitemannotation *annotation;
@property(copy, nonatomic, readonly)NSString *name;
@property(assign, nonatomic, readonly)CGFloat latitude;
@property(assign, nonatomic, readonly)CGFloat longitude;
@property(assign, nonatomic)BOOL closer;

@end