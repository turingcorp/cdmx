#import "vradiationabout.h"
#import "cradiationabout.h"
#import "vradiationaboutheader.h"
#import "vradiationaboutcell.h"
#import "ecollectioncell.h"
#import "ecollectionreusable.h"

static NSInteger const radiationaboutbottom = 60;
static NSInteger const radiationaboutheaderheight = 70;
static NSInteger const radiationaboutcellheight = 60;

@interface vradiationabout ()

@property(weak, nonatomic)cradiationabout *controller;
@property(strong, nonatomic, readwrite)mradiationabout *model;

@end

@implementation vradiationabout

@dynamic controller;

-(instancetype)init:(ccontroller*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:NSLocalizedString(@"vradiation_about_title", nil)];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, radiationaboutbottom, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vradiationaboutheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vradiationaboutheader reusableidentifier]];
    [collection registerClass:[vradiationaboutcell class] forCellWithReuseIdentifier:[vradiationaboutcell reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"bar":self.bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(mradiationaboutitem*)itemforindex:(NSIndexPath*)index
{
    mradiationaboutitem *item = self.model.sections[index.section].items[index.item];
    
    return item;
}

-(mradiationaboutsection*)sectionforindex:(NSIndexPath*)index
{
    mradiationaboutsection *section = self.model.sections[index.section];
    
    return section;
}

#pragma mark public

-(void)viewdidappear
{
    if(!self.model)
    {
        __weak typeof(self) welf = self;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                       ^
                       {
                           welf.model = [mradiationabout model];
                           
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [welf.collection reloadData];
                                          });
                       });
    }
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, radiationaboutheaderheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, radiationaboutcellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSInteger count = self.model.sections.count;
    
    return count;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.sections[section].items.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    mradiationaboutsection *section = [self sectionforindex:index];
    vradiationaboutheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[vradiationaboutheader reusableidentifier] forIndexPath:index];
    [header config:section];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mradiationaboutitem *item = [self itemforindex:index];
    vradiationaboutcell *cell = [col dequeueReusableCellWithReuseIdentifier:[vradiationaboutcell reusableidentifier] forIndexPath:index];
    [cell config:item];
    
    return cell;
}

@end