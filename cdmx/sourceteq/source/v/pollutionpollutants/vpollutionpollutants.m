#import "vpollutionpollutants.h"
#import "cpollutionpollutants.h"
#import "vpollutionpollutantscell.h"
#import "vpollutionpollutantsheader.h"
#import "ecollectioncell.h"
#import "ecollectionreusable.h"

static NSInteger const pollutantsheaderheight = 100;
static NSInteger const pollutantscellheight = 300;
static NSInteger const pollutantcollectionbottom = 120;

@interface vpollutionpollutants ()

@property(weak, nonatomic)cpollutionpollutants *controller;

@end

@implementation vpollutionpollutants

@dynamic controller;

-(instancetype)init:(cpollutionpollutants*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:NSLocalizedString(@"vpollution_pollutants_title", nil)];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setSectionInset:UIEdgeInsetsZero];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setClipsToBounds:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vpollutionpollutantscell class] forCellWithReuseIdentifier:[vpollutionpollutantscell reusableidentifier]];
    [collection registerClass:[vpollutionpollutantsheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vpollutionpollutantsheader reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"bar":self.bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(mpollutionpollutant*)modelforindex:(NSIndexPath*)index
{
    mpollutionpollutant *model = self.controller.items[index.section];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, pollutantscellheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, pollutantsheaderheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSInteger count = self.controller.items.count;
    
    return count;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    mpollutionpollutant *model = [self modelforindex:index];
    vpollutionpollutantsheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[vpollutionpollutantsheader reusableidentifier] forIndexPath:index];
    [header config:model];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vpollutionpollutantscell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionpollutantscell reusableidentifier] forIndexPath:index];
    
    return cell;
}

@end