#import "vpollutionfrontlayout.h"

@implementation vpollutionfrontlayout

-(instancetype)init
{
    self = [super init];
    [self setFooterReferenceSize:CGSizeZero];
    [self setMinimumInteritemSpacing:0];
    [self setMinimumLineSpacing:0];
    [self setMinimumLineSpacing:0];
    
    return self;
}

-(UICollectionViewLayoutAttributes*)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingSupplementaryElementOfKind:kind atIndexPath:index];
    attributes.frame = CGRectMake(attributes.frame.origin.x, 30, attributes.frame.size.width, attributes.frame.size.height);
    attributes.alpha = 0.3;
    
    return attributes;
}

-(UICollectionViewLayoutAttributes*)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingSupplementaryElementOfKind:kind atIndexPath:index];
    attributes.frame = CGRectMake(attributes.frame.origin.x, 30, attributes.frame.size.width, attributes.frame.size.height);
    attributes.alpha = 0.3;
    
    return attributes;
}

-(UICollectionViewLayoutAttributes*)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath*)index
{
    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:index];
    attributes.frame = CGRectMake(attributes.frame.origin.x, -30, attributes.frame.size.width, attributes.frame.size.height);
    attributes.alpha = 0.3;
    
    return attributes;
}

-(UICollectionViewLayoutAttributes*)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath*)index
{
    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:index];
    attributes.frame = CGRectMake(attributes.frame.origin.x, -30, attributes.frame.size.width, attributes.frame.size.height);
    attributes.alpha = 0.3;
    
    return attributes;
}

@end