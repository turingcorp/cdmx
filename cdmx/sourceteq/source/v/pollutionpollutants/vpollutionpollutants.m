#import "vpollutionpollutants.h"
#import "cpollutionpollutants.h"
#import "vpollutionpollutantscell.h"
#import "vpollutionpollutantsheader.h"
#import "ecollectioncell.h"
#import "ecollectionreusable.h"
#import "efont.h"

static NSInteger const pollutantsheaderheight = 130;
static NSInteger const pollutantcollectionbottom = 60;

@interface vpollutionpollutants ()

@property(weak, nonatomic)cpollutionpollutants *controller;

@end

@implementation vpollutionpollutants

@dynamic controller;

-(instancetype)init:(cpollutionpollutants*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    
    NSString *stringtitle;
    
    if(controller.items.count > 1)
    {
        stringtitle = NSLocalizedString(@"vpollution_pollutants_title_plural", nil);
    }
    else
    {
        stringtitle = NSLocalizedString(@"vpollution_pollutants_title_singular", nil);
    }
    
    [self.bar title:stringtitle];
    
    return self;
}

-(void)layoutSubviews
{
    if(!self.collection)
    {
        __weak typeof(self) welf = self;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                       ^
                       {
                           CGFloat width = welf.bounds.size.width;
                           
                           if(width)
                           {
                               NSDictionary *pollutants = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"pollutants" withExtension:@"plist"]];
                               NSDictionary *attributes = @{NSFontAttributeName:[UIFont regularsize:15]};
                               
                               for(mpollutionpollutant *item in welf.controller.items)
                               {
                                   NSNumber *pollutantid = item.serverid;
                                   NSString *pollutantkey = [NSString stringWithFormat:@"%@", pollutantid];
                                   NSDictionary *rawpollutant = pollutants[pollutantkey];
                                   
                                   if(rawpollutant)
                                   {
                                       NSString *symbol = rawpollutant[@"symbol"];
                                       NSString *info = rawpollutant[@"info"];
                                       
                                       if(!symbol)
                                       {
                                           symbol = @"";
                                       }
                                       
                                       [item createattributedstring:info attributes:attributes width:width];
                                       item.symbol = symbol;
                                   }
                               }
                               
                               dispatch_async(dispatch_get_main_queue(),
                                              ^
                                              {
                                                  [welf addcollection];
                                              });
                           }
                       });
    }
    
    [super layoutSubviews];
}

#pragma mark functionality

-(void)addcollection
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, pollutantcollectionbottom, 0)];
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
    [collection registerClass:[vpollutionpollutantsheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vpollutionpollutantsheader reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"bar":self.bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
}

-(mpollutionpollutant*)modelforindex:(NSIndexPath*)index
{
    mpollutionpollutant *model = self.controller.items[index.section];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionpollutant *model = [self modelforindex:index];
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, model.cellheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, pollutantsheaderheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSInteger count = self.controller.items.count;
    
    return count;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    mpollutionpollutant *model = [self modelforindex:index];
    vpollutionpollutantsheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[vpollutionpollutantsheader reusableidentifier] forIndexPath:index];
    [header config:model];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionpollutant *model = [self modelforindex:index];
    vpollutionpollutantscell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionpollutantscell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end