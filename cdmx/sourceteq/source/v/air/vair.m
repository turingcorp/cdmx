#import "vair.h"
#import "vairbar.h"
#import "vaircell.h"

static NSString* const cellairid = @"cellair";
static NSUInteger const mapheight = 200;
static NSUInteger const collectionbottom = 40;
static NSUInteger const cellheight = 60;

@implementation vair

-(instancetype)init:(cair*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vairbar *bar = [[vairbar alloc] init];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:1];
    [flow setSectionInset:UIEdgeInsetsMake(mapheight, 0, collectionbottom, 0)];
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
    [collection registerClass:[vaircell class] forCellWithReuseIdentifier:cellairid];
    
    [self addSubview:bar];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
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
    return 0;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vaircell *cell = [col dequeueReusableCellWithReuseIdentifier:cellairid forIndexPath:index];
    
    return cell;
}

@end