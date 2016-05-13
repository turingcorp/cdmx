#import "vpollutionmap.h"
#import "cpollution.h"
#import "vpollutionmapcell.h"
#import "vpollutionmapheader.h"
#import "ecollectioncell.h"
#import "ecollectionreusable.h"

static NSInteger const mapheaderheight = 150;
static NSInteger const mapcellheight = 50;
static NSInteger const mapcollectionbottom = 120;
static NSInteger const mapinteritemspace = -1;

@implementation vpollutionmap

-(instancetype)init:(cpollution*)controller
{
    self = [super init:controller];
    self.model = (mpollutionmap*)controller.model.option;
    
    vpollutionmapdisplay *display = [[vpollutionmapdisplay alloc] init];
    self.display = display;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:mapinteritemspace];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, mapcollectionbottom, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vpollutionmapcell class] forCellWithReuseIdentifier:[vpollutionmapcell reusableidentifier]];
    [collection registerClass:[vpollutionmapheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vpollutionmapheader reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:display];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"display":display, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[display]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[display]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionalitysetfo

-(mpollutionmapitem*)modeforindex:(NSIndexPath*)index
{
    mpollutionmapitem *model = self.model.items[index.item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, mapcellheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, mapheaderheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionmapitem *model = [self modeforindex:index];
    vpollutionmapcell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionmapcell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end