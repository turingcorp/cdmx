#import <Foundation/Foundation.h>

@interface mdbpollutiondaily:NSObject

+(instancetype)empty;

@property(copy, nonatomic)NSNumber *primarykey;
@property(copy, nonatomic)NSNumber *created;
@property(copy, nonatomic)NSNumber *date;
@property(copy, nonatomic)NSNumber *pollution;

@end