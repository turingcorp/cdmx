#import "vradiationprecautions.h"

static NSInteger const precautionsheight = 50;

@implementation vradiationprecautions

-(instancetype)init
{
    self = [super init];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setUserInteractionEnabled:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    self.collection = collection;
    
    [self addSubview:collection];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, precautionsheight);
    
    return size;
}

@end