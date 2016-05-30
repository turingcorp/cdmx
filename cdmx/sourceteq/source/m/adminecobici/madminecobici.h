#import <Foundation/Foundation.h>
#import "madminecobicistation.h"

@interface madminecobici:NSObject

-(void)append:(NSArray<madminecobicistation*>*)stations;

@property(strong, nonatomic, readonly)NSArray<madminecobicistation*> *stations;

@end