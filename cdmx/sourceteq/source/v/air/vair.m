#import "vair.h"
#import "vairbar.h"
#import "vairmap.h"
#import "vaircell.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"
#import "nsnotification+nsnotificationmain.h"
#import "mstations.h"

static NSString* const cellairid = @"cellair";
static NSInteger const mapheight = 300;
static NSInteger const cellheight = 65;

@implementation vair

-(instancetype)init:(cair*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    self.controller = controller;
    
    vairbar *bar = [[vairbar alloc] init:controller];
    
    vairmap *map = [[vairmap alloc] init:controller];
    
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
    self.collection = collection;
    
    [self addSubview:bar];
    [self addSubview:collection];
    [self addSubview:map];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection, @"map":map};
    NSDictionary *metrics = @{@"mapheight":@(mapheight)};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:navbarheight];
    self.layoutmapheight = [NSLayoutConstraint constraintWithItem:map attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:mapheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[map]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    [self addConstraint:self.layoutmapheight];
 
    [self refresh];
    [NSNotification observe:self stationsloaded:@selector(notifiedstationsloaded:)];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedstationsloaded:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self refresh];
                   });
}

#pragma mark functionality

-(void)refresh
{
    if([mstations singleton].error || ![mstations singleton].readings.count)
    {
        self.lastreading = nil;
    }
    else
    {
        self.lastreading = [[mstations singleton].readings lastObject];
    }
    
    [self.collection reloadData];
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offset = self.collection.contentOffset.y;
    CGFloat offset_10 = offset / 10.0;
    CGFloat barheight = navbarheight - offset_10;
    CGFloat newmapheight = mapheight - offset;
    
    if(barheight < navbarheightmin)
    {
        barheight = navbarheightmin;
    }
    else if(barheight > navbarheight)
    {
        barheight = navbarheight;
    }
    
    if(newmapheight < 0)
    {
        newmapheight = 0;
    }
    
    self.layoutbarheight.constant = barheight;
    self.layoutmapheight.constant = newmapheight;
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
    NSUInteger count = self.lastreading.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vaircell *cell = [col dequeueReusableCellWithReuseIdentifier:cellairid forIndexPath:index];
    [cell config:self.lastreading.items[index.item]];
    
    return cell;
}

@end