#import <Foundation/Foundation.h>

@interface mpollutiondistitem : NSObject

-(instancetype)init:(NSString*)name;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *texturename;

@end