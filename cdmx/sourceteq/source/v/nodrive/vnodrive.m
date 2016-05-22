#import "vnodrive.h"
#import "vnodrivebar.h"
#import "vnodrivecell.h"
#import "vnodriveheader.h"
#import "ecollectionreusable.h"

static NSInteger const nodriveheaderheight = 60;
static NSInteger const nodrivecoltop = 20;
static NSInteger const nodrivecolbottom = 40;

@interface vnodrive ()

@property(strong, nonatomic, readwrite)mnodrivetoday *model;

@end

@implementation vnodrive

-(instancetype)init:(cnodrive*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vnodrivebar *bar = [[vnodrivebar alloc] init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setClipsToBounds:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vnodriveheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vnodriveheader reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:bar];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(mnodrivetodaysection*)sectionforindex:(NSIndexPath*)index
{
    mnodrivetodaysection *model = self.model.sections[index.section];
    
    return model;
}

-(mnodrivetodayitem*)itemforindex:(NSIndexPath*)index
{
    mnodrivetodayitem *model = self.model.sections[index.section].items[index.item];
    
    return model;
}

#pragma mark public

-(void)nodriveloaded:(mnodrivetoday*)model
{
    self.model = model;
    
    for(mnodrivetodaysection *section in model.sections)
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

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    mnodrivetodaysection *model = self.model.sections[section];
    CGFloat margin = 0;
    
    if(!model.fullwidth)
    {
        CGFloat width = col.bounds.size.width;
        CGFloat cellwidth = model.cellwidth;
        CGFloat allcells = cellwidth * model.cellsperrow;
        CGFloat remain = width - allcells;
        
        if(remain > 0)
        {
            margin = remain / 2.0;
        }
    }
    
    UIEdgeInsets insets = UIEdgeInsetsMake(nodrivecoltop, margin, nodrivecolbottom, margin);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, nodriveheaderheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    mnodrivetodaysection *model = [self sectionforindex:index];
    NSInteger width;
    NSInteger height = model.cellheight;
    
    if(model.fullwidth)
    {
        width = col.bounds.size.width;
    }
    else
    {
        width = model.cellwidth;
    }
    
    CGSize size = CGSizeMake(width, height);
    
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
    mnodrivetodaysection *model = [self sectionforindex:index];
    vnodriveheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[vnodriveheader reusableidentifier] forIndexPath:index];
    [header config:model];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mnodrivetodaysection *section = [self sectionforindex:index];
    mnodrivetodayitem *item = [self itemforindex:index];
    vnodrivecell *cell = [col dequeueReusableCellWithReuseIdentifier:section.reusableidentifier forIndexPath:index];
    [cell config:item];
    
    return cell;
}

@end