#import <Foundation/Foundation.h>
#import "mpollutionindex.h"

@interface mpollutionchartitempoint:NSObject

-(instancetype)init:(mpollutionindex*)index name:(NSString*)name;

@property(strong, nonatomic)mpollutionindex *index;
@property(copy, nonatomic)NSString *name;
@property(assign, nonatomic)CGFloat x;
@property(assign, nonatomic)CGFloat y;

@end