#import "vnodriveholograms.h"
#import "vnodrivehologramscell.h"

static NSString* const hologramcellid = @"hologramcell";
static NSInteger const linespacing = 2;
static NSInteger const cellwidth = 76;

@implementation vnodriveholograms

-(instancetype)init:(mstationsnodrive*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    self.model = model;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:linespacing];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setUserInteractionEnabled:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vnodrivehologramscell class] forCellWithReuseIdentifier:hologramcellid];
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    NSInteger totalcells = self.model.holograms.count;
    NSInteger widthcells = (cellwidth * totalcells) + (linespacing * (totalcells - 1));
    CGFloat remain = width - widthcells;
    CGFloat margin = remain / 2.0;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat height = col.bounds.size.height;
    CGSize size = CGSizeMake(cellwidth, height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return self.model.holograms.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vnodrivehologramscell *cell = [col dequeueReusableCellWithReuseIdentifier:hologramcellid forIndexPath:index];
    [cell config:self.model.holograms[index.item]];
    
    return cell;
}

@end