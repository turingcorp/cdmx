#import "vradiationprecautions.h"
#import "vradiationprecautionscell.h"
#import "ecollectioncell.h"

static NSInteger const precautionsheight = 60;
static NSInteger const precautionscellwidth = 100;

@implementation vradiationprecautions

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
    [flow setItemSize:CGSizeMake(precautionscellwidth, precautionsheight)];
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
    [collection registerClass:[vradiationprecautionscell class] forCellWithReuseIdentifier:[vradiationprecautionscell reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, precautionsheight);
    
    return size;
}

#pragma mark functionality

-(mradiationprecaution*)modelforindex:(NSIndexPath*)index
{
    mradiationprecaution *model = self.model.precautions[index.item];
    
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

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat cells = self.model.precautions.count;
    CGFloat width = col.bounds.size.width;
    CGFloat cellswidth = cells * precautionscellwidth;
    CGFloat remain = width - cellswidth;
    CGFloat margin = remain / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.precautions.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mradiationprecaution *model = [self modelforindex:index];
    vradiationprecautionscell *cell = [col dequeueReusableCellWithReuseIdentifier:[vradiationprecautionscell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end