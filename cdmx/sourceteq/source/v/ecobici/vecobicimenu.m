#import "vecobicimenu.h"
#import "vecobicimenucell.h"
#import "ecollectioncell.h"

static NSInteger const ecobicimenucellwidth = 60;

@interface vecobicimenu ()

@property(weak, nonatomic, readwrite)UICollectionView *collection;
@property(weak, nonatomic, readwrite)cecobici *controller;
@property(strong, nonatomic, readwrite)mecobicimenu *model;

@end

@implementation vecobicimenu

-(instancetype)init:(cecobici*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    self.controller = controller;
    self.model = [[mecobicimenu alloc] init];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vecobicimenucell class] forCellWithReuseIdentifier:[vecobicimenucell reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark private

-(mecobicimenuitem*)modelforindex:(NSIndexPath*)index
{
    mecobicimenuitem *model = self.model.items[index.item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGFloat cellswidth = self.model.items.count * ecobicimenucellwidth;
    CGFloat remain = width - cellswidth;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, remain);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat height = col.bounds.size.height;
    CGSize size = CGSizeMake(ecobicimenucellwidth, height);
    
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
    mecobicimenuitem *model = [self modelforindex:index];
    vecobicimenucell *cell = [col dequeueReusableCellWithReuseIdentifier:[vecobicimenucell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end