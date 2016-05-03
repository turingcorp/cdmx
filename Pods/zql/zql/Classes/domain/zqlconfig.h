#import <Foundation/Foundation.h>

@interface zqlconfig:NSObject

+(instancetype)shared;
-(void)createdb:(NSString*)dbname;
-(void)startdb:(NSString*)dbname;

@property(copy, readonly,nonatomic)NSString *dbname;

@end