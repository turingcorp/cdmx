#import <UIKit/UIKit.h>

@interface mnodrivetodayitem:NSObject

@property(copy, nonatomic, readonly)NSString *reusableidentifier;
@property(assign, nonatomic, readonly)Class cellclass;
@property(assign, nonatomic, readonly)NSInteger cellwidth;
@property(assign, nonatomic, readonly)NSInteger cellheight;
@property(assign, nonatomic, readonly)BOOL fullwidth;

@end