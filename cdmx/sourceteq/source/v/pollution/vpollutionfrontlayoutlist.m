#import "vpollutionfrontlayoutlist.h"

@implementation vpollutionfrontlayoutlist

-(instancetype)init
{
    self = [super init];
    [self setFooterReferenceSize:CGSizeZero];
    [self setMinimumInteritemSpacing:0];
    [self setMinimumLineSpacing:0];
    [self setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    return self;
}

@end