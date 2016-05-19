#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface msettings:NSObject

+(instancetype)singleton;
-(void)load;
-(void)save;

@property(strong, nonatomic)EAGLContext *context;
@property(nonatomic)BOOL notifications;

@end