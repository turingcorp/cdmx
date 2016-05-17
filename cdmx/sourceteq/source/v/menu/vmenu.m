#import "vmenu.h"
#import "cmenu.h"
#import "vmenuheader.h"
#import "vmenucell.h"
#import "vmenubar.h"
#import "ecollectionreusable.h"
#import "ecollectioncell.h"

static NSInteger const menucollectionbottom = 40;
static NSInteger const menuheaderheight = 32;
static NSInteger const menucellheight = 60;

@interface vmenu ()

@property(weak, nonatomic)cmenu *controller;

@end

@implementation vmenu

@dynamic controller;

-(instancetype)init:(cmenu*)controller
{
    self = [super init:controller];

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, menucollectionbottom, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vmenucell class] forCellWithReuseIdentifier:[vmenucell reusableidentifier]];
    [collection registerClass:[vmenuheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vmenuheader reusableidentifier]];
    self.collection = collection;

    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"bar":self.bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(mmenusection*)sectionforindex:(NSIndexPath*)index
{
    mmenusection *model = self.controller.model.sections[index.section];
    
    return model;
}

-(mmenusectionitem*)itemforindex:(NSIndexPath*)index
{
    mmenusectionitem *model = self.controller.model.sections[index.section].items[index.item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, menucellheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, menuheaderheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSInteger countsections = self.controller.model.sections.count;
    
    return countsections;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger countitems = self.controller.model.sections[section].items.count;
    
    return countitems;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    mmenusection *model = [self sectionforindex:index];
    vmenuheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[vmenuheader reusableidentifier] forIndexPath:index];
    [header config:model];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mmenusectionitem *model = [self itemforindex:index];
    vmenucell *cell = [col dequeueReusableCellWithReuseIdentifier:[vmenucell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

#pragma mark view

-(vviewbar*)loadbar
{
    vmenubar *bar = [[vmenubar alloc] init:self.controller];
    
    return bar;
}

@end