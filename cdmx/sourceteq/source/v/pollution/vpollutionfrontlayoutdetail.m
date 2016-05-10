#import "vpollutionfrontlayoutdetail.h"

@implementation vpollutionfrontlayoutdetail

-(instancetype)init
{
    self = [super init];
    [self setHeaderReferenceSize:CGSizeZero];
    [self setMinimumInteritemSpacing:0];
    [self setMinimumLineSpacing:0];
    [self setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    return self;
}

@end