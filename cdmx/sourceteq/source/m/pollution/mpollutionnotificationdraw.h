#import <GLKit/GLKit.h>
#import <Foundation/Foundation.h>

@interface mpollutionnotificationdraw:NSDictionary

-(instancetype)init:(GLKBaseEffect*)baseeffect pointertexture:(GLKVector2*)pointertexture;

@property(weak, nonatomic)GLKBaseEffect *baseeffect;
@property(assign, nonatomic)GLKVector2 *pointertexture;

@end
