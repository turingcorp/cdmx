#import "vnodriveplates.h"
#import "vnodriveplatescell.h"

static NSString* const platescellid = @"platescell";
static NSInteger const linespacing = 6;
static NSInteger const cellwidth = 70;
static NSInteger const cellheight = 70;

@implementation vnodriveplates

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
    [flow setItemSize:CGSizeMake(cellwidth, cellheight)];
    [flow setMinimumLineSpacing:linespacing];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setUserInteractionEnabled:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vnodriveplatescell class] forCellWithReuseIdentifier:platescellid];
    
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
    NSInteger cells = self.model.plates[section].numbers.count;
    NSInteger totalcellswidth = (cellwidth * cells) + (linespacing * (cells - 1));
    CGFloat width = col.bounds.size.width;
    CGFloat remain = width - totalcellswidth;
    CGFloat margin = remain / 2.0;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, linespacing, margin);
    
    return insets;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSInteger count = self.model.plates.count;
    
    return count;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.plates[section].numbers.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mstationsnodriveplate *plate = self.model.plates[index.section];
    NSNumber *number = plate.numbers[index.item];
    
    vnodriveplatescell *cell = [col dequeueReusableCellWithReuseIdentifier:platescellid forIndexPath:index];
    [cell config:plate number:number];
    
    return cell;
}

@end