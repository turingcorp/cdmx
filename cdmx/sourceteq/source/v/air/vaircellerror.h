#import <UIKit/UIKit.h>
#import "vair.h"

@interface vaircellerror:UICollectionViewCell

-(void)config:(vair*)view error:(NSString*)error;

@property(weak, nonatomic)vair *view;
@property(weak, nonatomic)UILabel *label;

@end