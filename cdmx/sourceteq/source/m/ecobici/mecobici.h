#import <Foundation/Foundation.h>
#import "mecobiciitem.h"
#import "mdbecobicistation.h"

@interface mecobici:NSObject

-(instancetype)init:(NSArray<mdbecobicistation*>*)stations;
-(NSArray<mecobiciitemannotation*>*)annotations;

@property(strong, nonatomic, readonly)NSArray<mecobiciitem*> *items;
@property(weak, nonatomic, readonly)NSArray<mecobiciitemannotation*> *modelannotations;

@end