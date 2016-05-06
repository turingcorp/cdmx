#import "vpollutionimeca.h"
#import "efont.h"

static NSInteger const labelmarginx = 10;
static NSInteger const labelmargintop = 10;
static NSInteger const labelmarginbottom = 50;

@implementation vpollutionimeca
{
    NSInteger summarginx;
    NSInteger summarginy;
}

-(instancetype)init:(ccontroller*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:NSLocalizedString(@"vpollutionimeca_title", nil)];
    
    summarginx = labelmarginx + labelmarginx;
    summarginy = labelmargintop + labelmarginbottom;
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    [scroll setClipsToBounds:YES];
    [scroll setTranslatesAutoresizingMaskIntoConstraints:NO];
    [scroll setShowsHorizontalScrollIndicator:NO];
    [scroll setShowsVerticalScrollIndicator:NO];
    [scroll setAlwaysBounceVertical:YES];
    self.scroll = scroll;
    
    self.attrstring = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"vpollutionimeca_descr", nil) attributes:@{NSFontAttributeName:[UIFont regularsize:18]}];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setTextColor:[UIColor colorWithWhite:0.3 alpha:1]];
    [label setAttributedText:self.attrstring];
    self.label = label;
    
    [scroll addSubview:label];
    [self addSubview:scroll];
    
    NSDictionary *views = @{@"scroll":scroll, @"bar":self.bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.scroll.bounds.size.width;
    CGFloat remainwidth = width - summarginx;
    CGFloat textheight = ceilf([self.attrstring boundingRectWithSize:CGSizeMake(remainwidth, 3000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size.height);
    CGSize size = CGSizeMake(width, textheight + summarginy);
    CGRect frame = CGRectMake(labelmarginx, labelmargintop, remainwidth, textheight);
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf.scroll setContentSize:size];
                       [welf.label setFrame:frame];
                   });
    
    [super layoutSubviews];
}

@end