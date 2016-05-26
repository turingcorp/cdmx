#import "vpollutionpollutants.h"
#import "cpollutionpollutants.h"
#import "vpollutionpollutantscell.h"
#import "ecollectioncell.h"
#import "efont.h"

static NSInteger const pollutantscellheight = 60;
static NSInteger const pollutantscollectionbottom = 40;
static NSInteger const pollutantsinteritem = -1;

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
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:pollutantsinteritem];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, pollutantscollectionbottom, 0)];
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
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"bar":self.bar};
    NSDictionary *metrics = @{@"border":@(pollutantsinteritem)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-(border)-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(mpollutionpollutant*)modelforindex:(NSIndexPath*)index
{
    mpollutionpollutant *model = self.controller.items[index.item];
    
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

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.controller.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionpollutant *model = [self modelforindex:index];
    vpollutionpollutantscell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionpollutantscell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionpollutant *model = [self modelforindex:index];
    [self.controller detail:model];
    
    dispatch_after(<#dispatch_time_t when#>, <#dispatch_queue_t queue#>, <#^(void)block#>)
}

@end