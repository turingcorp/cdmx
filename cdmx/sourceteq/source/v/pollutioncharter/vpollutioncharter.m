#import "vpollutioncharter.h"
#import "ecell.h"
#import "ereusable.h"
#import "vpollutioncharterheader.h"
#import "vpollutionchartercell.h"
#import "genericconstants.h"
#import "cpollution.h"

static NSInteger const chartercellheight = 40;
static NSInteger const charterinteritem = -1;

@implementation vpollutioncharter

-(instancetype)init:(cpollution*)controller
{
    self = [super init:controller];
    self.model = (mpollutionchart*)controller.model.option;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:charterinteritem];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsZero];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setBounces:NO];
    [collection setScrollEnabled:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vpollutioncharterheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vpollutioncharterheader reusableidentifier]];
    [collection registerClass:[vpollutionchartercell class] forCellWithReuseIdentifier:[vpollutionchartercell reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    if(self.model.items.count)
    {
        [collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        mpollutionchartitem *current = self.model.items[0];
        
        [self selectmodel:current];
    }
    
    return self;
}

#pragma mark functionality

-(mpollutionchartitem*)modelforindex:(NSIndexPath*)index
{
    mpollutionchartitem *model = self.model.items[index.item];
    
    return model;
}

-(void)selectmodel:(mpollutionchartitem*)model
{
    [self.model changeselected:model];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, chartercellheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, pollution_drawableheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vpollutioncharterheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[vpollutioncharterheader reusableidentifier] forIndexPath:index];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionchartitem *model = [self modelforindex:index];
    vpollutionchartercell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionchartercell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    BOOL selectable = YES;
    mpollutionchartitem *model = [self modelforindex:index];
    
    if(model == self.model.selected)
    {
        selectable = NO;
    }
    
    return selectable;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionchartitem *model = [self modelforindex:index];
    [self selectmodel:model];
}

@end