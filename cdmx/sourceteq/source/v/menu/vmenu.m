#import "vmenu.h"
#import "uicolor+uicolormain.h"
#import "vmenubanner.h"
#import "vmenuheader.h"
#import "vmenucell.h"
#import "cmain.h"

static NSString* const menuheaderid = @"headerid";
static NSString* const menucellid = @"cellid";
static NSUInteger const bannerheight = 200;
static NSUInteger const headerheight = 60;
static NSUInteger const cellheight = 70;

@implementation vmenu

-(instancetype)init:(cmenu*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    self.controller = controller;
    self.model = [cmain singleton].pages.model;
    
    vmenubanner *banner = [[vmenubanner alloc] init];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:1];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, collectionbottom, 0)];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setClipsToBounds:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vmenuheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:menuheaderid];
    [collection registerClass:[vmenucell class] forCellWithReuseIdentifier:menucellid];
    self.collection = collection;
    
    [self addSubview:banner];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"banner":banner, @"col":collection};
    NSDictionary *metrics = @{@"bannerheight":@(bannerheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[banner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[banner(bannerheight)]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, headerheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSUInteger sections = self.model.sections.count;
    
    return sections;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger items = self.model.sections[section].items.count;
    
    return items;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vmenuheader *reusable = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:menuheaderid forIndexPath:index];
    [reusable config:self.model.sections[index.section]];
    
    return reusable;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vmenucell *cell = [col dequeueReusableCellWithReuseIdentifier:menucellid forIndexPath:index];
    [cell config:self.model.sections[index.section].items[index.item]];
    
    return cell;
}

@end