#import <Foundation/Foundation.h>

@interface mpollutiontexturesitem:NSObject

-(instancetype)init:(NSString*)name assetname:(NSString*)assetname;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *assetname;
@property(assign, nonatomic)NSInteger textureid;

@end