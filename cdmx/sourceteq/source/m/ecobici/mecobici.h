#import <Foundation/Foundation.h>
#import "mecobiciitem.h"

@interface mecobici:NSObject

-(NSArray<mecobiciitemannotation*>*)annotations;

@property(strong, nonatomic, readonly)NSArray<mecobiciitem*> *items;
@property(weak, nonatomic, readonly)NSArray<mecobiciitemannotation*> *modelannotations;

@end