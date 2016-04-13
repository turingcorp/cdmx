#import <Foundation/Foundation.h>
#import "mstationsitem.h"
#import "acalldelegate.h"

@interface mstations:NSObject<acalldelegate>

+(instancetype)singleton;
-(void)load;

@property(strong, nonatomic)NSArray<mstationsitem*> *items;
@property(nonatomic)BOOL loaded;

@end