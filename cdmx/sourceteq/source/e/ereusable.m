#import "ereusable.h"

@implementation UICollectionReusableView (ereusable)

+(NSString*)reusableidentifier
{
    NSString *classname = NSStringFromClass([self class]);
    
    return classname;
}

@end