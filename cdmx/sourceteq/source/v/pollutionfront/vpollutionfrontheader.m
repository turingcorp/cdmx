#import "vpollutionfrontheader.h"
#import "genericconstants.h"
#import "ecolor.h"
#import "efont.h"
#import "vpollution.h"
#import "vpollutionfront.h"
#import "vpollutionfrontheadercell.h"
#import "ecollectioncell.h"

static NSInteger const frontheadercellheight = 50;
static NSInteger const frontheaderinteritem = -1;
static NSInteger const frontheadercollectionbottom = 50;
static NSInteger const infomarginx = 10;

@implementation vpollutionfrontheader
{
    CGFloat infowidth;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat width = frame.size.width;
    CGFloat bordery = pollution_drawableheight;
    infowidth = width - (infomarginx + infomarginx);
    
    UIView *blanket = [[UIView alloc] init];
    [blanket setUserInteractionEnabled:NO];
    [blanket setClipsToBounds:YES];
    [blanket setTranslatesAutoresizingMaskIntoConstraints:NO];
    [blanket setBackgroundColor:[UIColor whiteColor]];
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setUserInteractionEnabled:NO];
    [bordertop setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *labelpollutanttitle = [[UILabel alloc] init];
    [labelpollutanttitle setBackgroundColor:[UIColor clearColor]];
    [labelpollutanttitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelpollutanttitle setUserInteractionEnabled:NO];
    [labelpollutanttitle setTextColor:[UIColor colorWithWhite:0.6 alpha:1]];
    [labelpollutanttitle setNumberOfLines:0];
    [labelpollutanttitle setFont:[UIFont regularsize:12]];
    [labelpollutanttitle setTextAlignment:NSTextAlignmentCenter];
    [labelpollutanttitle setText:NSLocalizedString(@"vpollution_chart_header_pollutanttitle", nil)];
    self.labelpollutanttitle = labelpollutanttitle;
    
    UILabel *labelpollutant = [[UILabel alloc] init];
    [labelpollutant setBackgroundColor:[UIColor clearColor]];
    [labelpollutant setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelpollutant setUserInteractionEnabled:NO];
    [labelpollutant setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
    [labelpollutant setNumberOfLines:0];
    [labelpollutant setFont:[UIFont boldsize:14]];
    [labelpollutant setTextAlignment:NSTextAlignmentCenter];
    self.labelpollutant = labelpollutant;
    
    vpollutionradiochart *radiochart = [[vpollutionradiochart alloc] init];
    self.radiochart = radiochart;
    
    vpollutionfrontheadercurrent *current = [[vpollutionfrontheadercurrent alloc] init];
    [current addTarget:self action:@selector(actioncurrent:) forControlEvents:UIControlEventTouchUpInside];
    self.current = current;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:frontheaderinteritem];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsZero];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setBounces:NO];
    [collection setScrollEnabled:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vpollutionfrontheadercell class] forCellWithReuseIdentifier:[vpollutionfrontheadercell reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:blanket];
    [self addSubview:bordertop];
    [self addSubview:labelpollutanttitle];
    [self addSubview:labelpollutant];
    [self addSubview:radiochart];
    [self addSubview:current];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"blanket":blanket, @"labelpollutanttitle":labelpollutanttitle, @"labelpollutant":labelpollutant, @"radiochart":radiochart, @"current":current, @"collection":collection};
    NSDictionary *metrics = @{@"bordery":@(bordery), @"infomarginx":@(infomarginx)};
    
    self.layoutcollectionheight = [NSLayoutConstraint constraintWithItem:collection attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bordertop]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[bordertop(1)]-0-[current]-20-[radiochart]-10-[labelpollutanttitle(14)]-0-[labelpollutant(17)]" options:0 metrics:metrics views:views]
     ];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[collection]-0-|" options:0 metrics:metrics views:views]
     ];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelpollutanttitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelpollutant]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[radiochart]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collection]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[current]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutcollectionheight];
    
    return self;
}

-(void)actioncurrent:(UIButton*)button
{
    [(vpollutionfront*)self.controller.view.option showlist];
}

#pragma mark public

-(void)config:(mpollutionfrontitem*)model controller:(cpollution*)controller
{
    self.model = model;
    self.controller = controller;
    
    [self.radiochart render:model.index];
    [self.current config:model];
    
    if(model.pollutant)
    {
        [self.labelpollutanttitle setHidden:NO];
        [self.labelpollutant setHidden:NO];
        [self.labelpollutant setText:model.pollutant.name];
    }
    else
    {
        [self.labelpollutanttitle setHidden:YES];
        [self.labelpollutant setHidden:YES];
    }
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       welf.options = [welf.model options];
                       NSInteger countoptions = welf.options.count;
                       NSInteger optionsheight = (countoptions * frontheadercellheight) + frontheadercollectionbottom;
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          welf.layoutcollectionheight.constant = optionsheight;
                                          [welf.collection reloadData];
                                      });
                   });
}

#pragma mark functionality

-(mpollutionfrontitemoption*)modelforindex:(NSIndexPath*)index
{
    mpollutionfrontitemoption *model = self.options[index.item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, frontheadercellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.options.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionfrontitemoption *model = [self modelforindex:index];
    vpollutionfrontheadercell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionfrontheadercell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionfrontitemoption *model = [self modelforindex:index];
    UIViewController *controller = [model controller];
    [self.controller option:controller];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                   ^
                   {
                       UICollectionViewCell *cell = [col cellForItemAtIndexPath:index];
                       [cell setSelected:NO];
                   });
}

@end