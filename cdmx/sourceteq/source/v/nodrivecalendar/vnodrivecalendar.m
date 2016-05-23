#import "vnodrivecalendar.h"
#import "cnodrivecalendar.h"
#import "vnodrivecalendarheader.h"
#import "vnodrivecalendarcell.h"
#import "ecollectionreusable.h"

static NSInteger const calendarheaderheight = 60;
static NSInteger const calendarsectionbottom = 50;
static NSInteger const calendarinteritem = -1;

@interface vnodrivecalendar ()

@property(strong, nonatomic, readwrite)mnodrivecalendar *model;

@end

@implementation vnodrivecalendar

-(instancetype)init:(cnodrivecalendar*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:NSLocalizedString(@"vnodrive_calendar_title", nil)];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:calendarinteritem];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, calendarsectionbottom, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vnodrivecalendarheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vnodrivecalendarheader reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"bar":self.bar, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(mnodrivecalendarsection*)sectionforindex:(NSIndexPath*)index
{
    mnodrivecalendarsection *section = self.model.sections[index.section];
    
    return section;
}

-(mnodrivecalendaritem*)itemforindex:(NSIndexPath*)index
{
    mnodrivecalendaritem *item = self.model.sections[index.section].items[index.item];
    
    return item;
}

#pragma mark public

-(void)modelcalendar:(mnodrivecalendar*)model
{
    self.model = model;
    
    for(mnodrivecalendarsection *section in model.sections)
    {
        if(section.items.count)
        {
            [self.collection registerClass:section.cellclass forCellWithReuseIdentifier:section.reusableidentifier];
        }
    }
    
    [self.collection reloadData];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, calendarheaderheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    mnodrivecalendarsection *section = [self sectionforindex:index];
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, section.cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSUInteger count = self.model.sections.count;
    
    return count;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.model.sections[section].items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mnodrivecalendarsection *section = [self sectionforindex:index];
    mnodrivecalendaritem *item = [self itemforindex:index];
    vnodrivecalendarcell *cell = [col dequeueReusableCellWithReuseIdentifier:section.reusableidentifier forIndexPath:index];
    [cell config:item];
    
    return cell;
}

@end