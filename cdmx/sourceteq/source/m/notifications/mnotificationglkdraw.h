#import <GLKit/GLKit.h>
#import <Foundation/Foundation.h>

@interface mnotificationglkdraw:NSDictionary

-(instancetype)init:(GLKBaseEffect*)baseeffect;

@property(weak, nonatomic)GLKBaseEffect *baseeffect;

@end