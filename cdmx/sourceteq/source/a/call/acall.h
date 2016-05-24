#import <Foundation/Foundation.h>

@class aparser;

@interface acall:NSObject

+(instancetype)pollution;
+(instancetype)radiation;
+(instancetype)nodrive;
-(NSURLRequest*)request;

@property(strong, nonatomic)aparser *parser;
@property(copy, nonatomic)NSString *urlstring;
@property(nonatomic)NSURLRequestCachePolicy cachepolicy;
@property(nonatomic)NSUInteger timeout;
@property(nonatomic)BOOL post;

@end