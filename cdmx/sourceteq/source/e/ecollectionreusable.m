#import "ecollectionreusable.h"

@implementation UICollectionReusableView (ecollectionreusable)

+(NSString*)reusableidentifier
{
    NSString *classname = NSStringFromClass([self class]);
    
    return classname;
}

@end