#import <Foundation/Foundation.h>
#import "madminecobicistation.h"
#import "mdbecobicistation.h"

@interface madminecobici:NSObject

-(void)append:(NSArray<madminecobicistation*>*)stations;
-(NSArray<mdbecobicistation*>*)dbmodel;

@property(strong, nonatomic, readonly)NSArray<madminecobicistation*> *stations;

@end