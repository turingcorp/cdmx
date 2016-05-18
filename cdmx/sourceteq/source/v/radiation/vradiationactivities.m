#import "vradiationactivities.h"
#import "vradiationactivitiescell.h"
#import "ecollectioncell.h"

static NSInteger const activitiesheight = 50;
static NSInteger const activitiescellwidth = 64;

@implementation vradiationactivities

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:0];
    [flow setItemSize:CGSizeMake(activitiescellwidth, activitiesheight)];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setUserInteractionEnabled:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vradiationactivitiescell class] forCellWithReuseIdentifier:[vradiationactivitiescell reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:collection];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, activitiesheight);
    
    return size;
}

#pragma mark functionality

-(mradiationactivity*)modelforindex:(NSIndexPath*)index
{
    mradiationactivity *model = self.model.activities[index.item];
    
    return model;
}

#pragma mark public

-(void)update:(mradiation*)model
{
    self.model = model;
    [self.collection reloadData];
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.activities.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mradiationactivity *model = [self modelforindex:index];
    vradiationactivitiescell *cell = [col dequeueReusableCellWithReuseIdentifier:[vradiationactivitiescell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end