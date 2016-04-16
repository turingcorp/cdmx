#import "vair.h"
#import "vairbar.h"
#import "vaircellerror.h"
#import "vaircellmain.h"
#import "vaircell.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"
#import "nsnotification+nsnotificationmain.h"
#import "mstations.h"

static NSString* const cellairerrorid = @"cellairerror";
static NSString* const cellairmainid = @"cellairmain";
static NSString* const cellairid = @"cellair";
static NSInteger const cellerrorheight = 200;
static NSInteger const cellmainheight = 360;
static NSInteger const cellheight = 65;
static NSInteger const interitem = 1;

@implementation vair

-(instancetype)init:(cair*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    self.controller = controller;
    
    
    
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
    self.firsttime = NO;
    [self checkcontent];
    [self.collection setDataSource:self];
    [self.collection setDelegate:self];
}

-(void)retry
{
    self.error = nil;
    [self.collection reloadData];
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
                height = cellmainheight;
            }
            else
            {
                height = cellerrorheight;
            }
        }
        else
        {
            height = cellmainheight;
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

@end