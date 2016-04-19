#import "vabout.h"
#import "vaboutbar.h"
#import "uicolor+uicolormain.h"
#import "vaboutcell.h"
#import "vaboutheader.h"

static NSString* const aboutheaderid = @"headerid";
static NSString* const aboutcellid = @"cellid";
static NSInteger const barheight = 150;
static NSInteger const linespacing = 1;
static NSInteger const headerheight = 100;
static NSInteger const cellheight = 60;

@implementation vabout

-(instancetype)init:(cabout*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    self.controller = controller;
    self.model = [[mabout alloc] init];
    
    vaboutbar *bar = [[vaboutbar alloc] init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:linespacing];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsZero];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vaboutcell class] forCellWithReuseIdentifier:aboutcellid];
    [collection registerClass:[vaboutheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:aboutheaderid];
    
    [self addSubview:collection];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection};
    NSDictionary *metrics = @{@"barheight":@(barheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(barheight)]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(maboutitem*)modelforindex:(NSIndexPath*)indexpath
{
    maboutitem *model = self.model.items[indexpath.item];
    
    return model;
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
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vaboutheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:aboutheaderid forIndexPath:index];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    maboutitem *model = [self modelforindex:index];
    vaboutcell *cell = [col dequeueReusableCellWithReuseIdentifier:aboutcellid forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end