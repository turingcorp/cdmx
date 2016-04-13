#import <UIKit/UIKit.h>
#import "mstations.h";

@class mdbitem;
@class mcourseitemchapter;

@interface mdb:NSObject

+(void)updatedb;
+(NSArray*)loadstations;

@end