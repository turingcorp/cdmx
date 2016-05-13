#import "ecollectioncell.h"

@implementation UICollectionViewCell (ecollectioncell)

+(NSString*)reusableidentifier
{
    NSString *classname = NSStringFromClass([self class]);
    
    return classname;
}

@end