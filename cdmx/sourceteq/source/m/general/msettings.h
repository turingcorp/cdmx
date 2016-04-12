#import "appdel.h"

@interface msettings:NSObject

+(instancetype)singleton;
-(void)save;

@property(nonatomic)NSUInteger starsrated;

@end