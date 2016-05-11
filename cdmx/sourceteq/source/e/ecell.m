#import "ecell.h"

@implementation UICollectionViewCell (ecell)

+(NSString*)reusableidentifier
{
    NSString *classname = NSStringFromClass([self class]);
    
    return classname;
}

@end