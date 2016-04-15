#import "vaircellmain.h"
#import "mstations.h"
#import "uifont+uifontmain.h"
#import "vaircellmaincell.h"

static NSString* const uvindexcellid = @"uvcell";
static NSInteger const uvwidth = 250;
static NSInteger const uvheight = 14;
static NSInteger const uvinteritem = 3;
static NSInteger const uvpadding = 10;
static NSInteger const uvmax = 11;

@implementation vaircellmain

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    
    CGFloat width = uvwidth;
    CGFloat remain = width - (uvpadding * 2);
    CGFloat itemwidthspace = (remain + uvinteritem) / uvmax;
    CGFloat itemwidth = itemwidthspace - uvinteritem;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:uvinteritem];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flow setSectionInset:UIEdgeInsetsMake(0, uvpadding, 0, uvpadding)];
    [flow setItemSize:CGSizeMake(itemwidth, uvheight)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setClipsToBounds:YES];
    [collection setUserInteractionEnabled:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vaircellmaincell class] forCellWithReuseIdentifier:uvindexcellid];
    self.collection = collection;
    
    UILabel *labeluv = [[UILabel alloc] init];
    [labeluv setBackgroundColor:[UIColor clearColor]];
    [labeluv setUserInteractionEnabled:NO];
    [labeluv setFont:[UIFont regularsize:18]];
    [labeluv setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    [labeluv setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeluv setText:NSLocalizedString(@"air_main_uvlabel", nil)];
    
    UILabel *labeluvindex = [[UILabel alloc] init];
    [labeluvindex setBackgroundColor:[UIColor clearColor]];
    [labeluvindex setUserInteractionEnabled:NO];
    [labeluvindex setFont:[UIFont boldsize:22]];
    [labeluvindex setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [labeluvindex setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.labeluvindex = labeluvindex;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    UILabel *labeltemp = [[UILabel alloc] init];
    [labeltemp setBackgroundColor:[UIColor clearColor]];
    [labeltemp setUserInteractionEnabled:NO];
    [labeltemp setFont:[UIFont regularsize:18]];
    [labeltemp setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [labeltemp setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.labeltemp = labeltemp;
    
    UILabel *labelhumidity = [[UILabel alloc] init];
    [labelhumidity setBackgroundColor:[UIColor clearColor]];
    [labelhumidity setUserInteractionEnabled:NO];
    [labelhumidity setFont:[UIFont regularsize:18]];
    [labelhumidity setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [labelhumidity setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.labelhumidity = labelhumidity;
    
    UIImageView *icontemp = [[UIImageView alloc] init];
    [icontemp setClipsToBounds:YES];
    [icontemp setUserInteractionEnabled:NO];
    [icontemp setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icontemp setContentMode:UIViewContentModeScaleAspectFit];
    [icontemp setImage:[UIImage imageNamed:@"stations_temp"]];
    
    UIImageView *iconhum = [[UIImageView alloc] init];
    [iconhum setClipsToBounds:YES];
    [iconhum setUserInteractionEnabled:NO];
    [iconhum setTranslatesAutoresizingMaskIntoConstraints:NO];
    [iconhum setContentMode:UIViewContentModeScaleAspectFit];
    [iconhum setImage:[UIImage imageNamed:@"stations_humidity"]];
    
    [self addSubview:labeluv];
    [self addSubview:labeluvindex];
    [self addSubview:label];
    [self addSubview:labeltemp];
    [self addSubview:labelhumidity];
    [self addSubview:icontemp];
    [self addSubview:iconhum];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"icontemp":icontemp, @"iconhum":iconhum, @"label":label, @"labeltemp":labeltemp, @"labelhumidity":labelhumidity, @"labeluv":labeluv, @"labeluvindex":labeluvindex, @"col":collection};
    NSDictionary *metrics = @{@"colwidth":@(uvwidth), @"colheight":@(uvheight)};
    
    self.layoutlabelheight = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icontemp(20)]-5-[labeltemp(100)]-0-[iconhum(20)]-5-[labelhumidity(100)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[icontemp(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-85-[iconhum(25)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-83-[labelhumidity(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-83-[labeltemp(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labeluv]-8-[labeluvindex]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col(colwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-155-[col(colheight)]-6-[labeluv]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[col]-2-[labeluvindex]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-210-[label]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutlabelheight];
    
    return self;
}

#pragma mark public

-(void)config
{
    if([mstations singleton].uv)
    {
        NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
        
        NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont boldsize:17], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.7]};
        NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont regularsize:15], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
        NSString *stringtitle = [mstations singleton].uv.title;
        NSString *stringdescr = [mstations singleton].uv.descr;
        NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dicttitle];
        NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:stringdescr attributes:dictdescr];
        [mut appendAttributedString:attrtitle];
        [mut appendAttributedString:attrdescr];
        
        CGFloat width = self.bounds.size.width - 20;
        CGFloat height = ceilf([mut boundingRectWithSize:CGSizeMake(width, 300) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
        
        [self.label setAttributedText:mut];
        self.layoutlabelheight.constant = height;
        
        NSString *stringindex = [NSString stringWithFormat:@"%@", @([mstations singleton].uv.index.number)];
        [self.labeluvindex setText:stringindex];
        
        [self.collection reloadData];
    }
    
    if([mstations singleton].generalconditions)
    {
        NSString *stringtemp = [NSString stringWithFormat:NSLocalizedString(@"air_main_temp", nil), @([mstations singleton].generalconditions.temperature)];
        NSString *stringhum = [NSString stringWithFormat:NSLocalizedString(@"air_main_hum", nil), @([mstations singleton].generalconditions.humidity)];
        
        [self.labeltemp setText:stringtemp];
        [self.labelhumidity setText:stringhum];
    }
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return uvmax;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vaircellmaincell *cell = [col dequeueReusableCellWithReuseIdentifier:uvindexcellid forIndexPath:index];
    [cell config:index];
    
    return cell;
}

@end