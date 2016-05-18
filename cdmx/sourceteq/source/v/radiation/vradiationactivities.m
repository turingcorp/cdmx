#import "vradiationactivities.h"

static NSInteger const activitiesheight = 50;

@implementation vradiationactivities

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
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
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, activitiesheight);
    
    return size;
}

@end