#import <Foundation/Foundation.h>
#import "mpollutionreaditem.h"
#import "mpollutiondistitem.h"

@interface mpollutionreaditemdist:mpollutionreaditem

-(instancetype)init:(mpollutiondistitem*)dist index:(mpollutionindex*)index;

@property(weak, nonatomic)mpollutiondistitem *dist;

@end