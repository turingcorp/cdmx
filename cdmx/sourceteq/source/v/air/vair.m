#import "vair.h"
#import "vaircellerror.h"
#import "vaircellmain.h"
#import "vaircell.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"
#import "nsnotification+nsnotificationmain.h"
#import "mstations.h"
#import "uifont+uifontmain.h"
#import "analytics.h"

static NSString* const cellairerrorid = @"cellairerror";
static NSString* const cellairmainid = @"cellairmain";
static NSString* const cellairid = @"cellair";
static NSInteger const cellerrorheight = 200;
static NSInteger const cellheight = 65;
static NSInteger const interitem = 1;
static NSInteger const labelmaincelltop = 210;
static NSInteger const labelmaincellbottom = 20;

@implementation vair
{
    NSMutableAttributedString *stringmaincell;
    NSInteger maincellstringheight;
}

-(instancetype)init:(cair*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    self.controller = controller;
    
    vairbar *bar = [[vairbar alloc] init:self.controller];
    self.bar = bar;
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:navbarheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    
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

-(void)checkcontent
{
    self.error = [mstations singleton].error;
    
    if(self.error || ![mstations singleton].readings.count)
    {
        self.lastreading = nil;
        [self.map clean];
    }
    else
    {
        self.lastreading = [[mstations singleton].readings lastObject];
        [self.map refresh];
        
        stringmaincell = [[NSMutableAttributedString alloc] init];
        
        NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont boldsize:17], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.7]};
        NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont regularsize:15], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
        NSString *stringtitle = [mstations singleton].uv.title;
        NSString *stringdescr = [mstations singleton].uv.descr;
        NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dicttitle];
        NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:stringdescr attributes:dictdescr];
        [stringmaincell appendAttributedString:attrtitle];
        [stringmaincell appendAttributedString:attrdescr];
        
        CGFloat width = self.bounds.size.width - 20;
        maincellstringheight = ceilf([stringmaincell boundingRectWithSize:CGSizeMake(width, 300) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
    }
}

-(void)refresh
{
    [self checkcontent];
    [self.collection reloadData];
}

-(mstationsreadingitem*)itemforindex:(NSUInteger)index
{
    mstationsreadingitem *item = self.lastreading.items[index];
    
    return item;
}

#pragma mark public

-(void)viewappear
{
    vairmap *map = [[vairmap alloc] init:self.controller];
    self.map = map;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:interitem];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setClipsToBounds:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection registerClass:[vaircellmain class] forCellWithReuseIdentifier:cellairmainid];
    [collection registerClass:[vaircellerror class] forCellWithReuseIdentifier:cellairerrorid];
    [collection registerClass:[vaircell class] forCellWithReuseIdentifier:cellairid];
    [collection setDelegate:self];
    [collection setDataSource:self];
    self.collection = collection;
    
    [self addSubview:collection];
    [self addSubview:map];
    
    NSDictionary *views = @{@"bar":self.bar, @"col":collection, @"map":map};
    NSDictionary *metrics = @{@"mapheight":@(airmapheight)};
    
    self.layoutmapheight = [NSLayoutConstraint constraintWithItem:map attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:airmapheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[map]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutmapheight];
    
    [NSNotification observe:self stationsloaded:@selector(notifiedstationsloaded:)];
    
    [self checkcontent];
}

-(void)retry
{
    self.error = nil;
    [self.collection reloadData];
    [[mstations singleton] fetch];
}

-(void)refetch
{
    [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:-1 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    
    [[mstations singleton] fetch];
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offset = self.collection.contentOffset.y;
    CGFloat offset_10 = offset / 10.0;
    CGFloat barheight = navbarheight - offset_10;
    CGFloat newmapheight = airmapheight - offset;
    
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

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets;
    
    if(section)
    {
        insets = UIEdgeInsetsMake(0, 0, collectionbottom, 0);
    }
    else
    {
        insets = UIEdgeInsetsMake(airmapheight + interitem, 0, interitem, 0);
    }
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGFloat height;
    
    if(index.section)
    {
        height = cellheight;
    }
    else
    {
        if(self.error)
        {
            if(index.item)
            {
                height = labelmaincelltop + labelmaincellbottom;
            }
            else
            {
                height = cellerrorheight;
            }
        }
        else
        {
            height = labelmaincelltop + labelmaincellbottom + maincellstringheight;
        }
    }
    
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count;
    
    if(section)
    {
        count = self.lastreading.items.count;
    }
    else
    {
        if(self.error)
        {
            count = 2;
        }
        else
        {
            count = 1;
        }
    }
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    NSUInteger section = index.section;
    NSUInteger item = index.item;
    
    UICollectionViewCell *cell;
    
    if(section)
    {
        cell = [col dequeueReusableCellWithReuseIdentifier:cellairid forIndexPath:index];
        [(vaircell*)cell config:[self itemforindex:item]];
    }
    else
    {
        if(self.error)
        {
            if(item)
            {
                cell = [col dequeueReusableCellWithReuseIdentifier:cellairmainid forIndexPath:index];
                [(vaircellmain*)cell config];
            }
            else
            {
                cell = [col dequeueReusableCellWithReuseIdentifier:cellairerrorid forIndexPath:index];
                [(vaircellerror*)cell config:self error:self.error];
            }
        }
        else
        {
            cell = [col dequeueReusableCellWithReuseIdentifier:cellairmainid forIndexPath:index];
            [(vaircellmain*)cell config];
            ((vaircellmain*)cell).layoutlabeltop.constant = labelmaincelltop;
            ((vaircellmain*)cell).layoutlabelheight.constant = maincellstringheight;
            [((vaircellmain*)cell).label setAttributedText:stringmaincell];
        }
    }
    
    return cell;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    BOOL should = NO;
    
    if(index.section)
    {
        should = YES;
    }
    
    return should;
}

-(BOOL)collectionView:(UICollectionView*)col shouldHighlightItemAtIndexPath:(NSIndexPath*)index
{
    BOOL should = NO;
    
    if(index.section)
    {
        should = YES;
    }
    
    return should;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mstationsreadingitem *item = [self itemforindex:index.item];
    [self.controller selectitem:item];
    
    [[analytics singleton] trackevent:ga_event_environment_station action:ga_action_detail label:item.name];
}

@end