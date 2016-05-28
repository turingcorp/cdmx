#import <UIKit/UIKit.h>

@interface mclimatecurrentitem:NSObject

@property(copy, nonatomic, readonly)NSString *reusableidentifier;
@property(assign, nonatomic, readonly)Class cellclass;
@property(assign, nonatomic, readonly)NSInteger cellheight;

@end