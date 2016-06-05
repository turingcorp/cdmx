#import <Foundation/Foundation.h>
#import "mecobiciitem.h"
#import "mdbecobicistation.h"

@interface mecobici:NSObject

-(instancetype)init:(NSArray<mdbecobicistation*>*)stations;
-(NSArray<mecobiciitemannotation*>*)annotations;
-(mecobiciitem*)closertolat:(CGFloat)lat lon:(CGFloat)lon;

@property(strong, nonatomic, readonly)NSArray<mecobiciitem*> *items;
@property(weak, nonatomic, readonly)NSArray<mecobiciitemannotation*> *modelannotations;

@end