#import "vpollutionrecommendation.h"
#import "cpollutionrecommendation.h"
#import "efont.h"
#import "ecolor.h"

static NSInteger const recommmargintop = 10;
static NSInteger const recommmaringhr = 10;

@interface vpollutionrecommendation ()

@property(weak, nonatomic)cpollutionrecommendation *controller;

@end

@implementation vpollutionrecommendation

@dynamic controller;

-(instancetype)init:(cpollutionrecommendation*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:controller.model.name];
    
    return self;
}

#pragma mark public

-(void)viewappear
{
    if(!self.label)
    {
        NSString *title = self.controller.model.index.name;
        NSString *recommendation = [self.controller.model.index recommendations];
        NSString *recommcompund = [NSString stringWithFormat:@"\n%@", recommendation];
        
        NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont boldsize:18], NSForegroundColorAttributeName:[UIColor main]};
        NSDictionary *attrrecomm = @{NSFontAttributeName:[UIFont regularsize:16], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.4 alpha:1]};
        
        NSAttributedString *astringtitle = [[NSAttributedString alloc] initWithString:title attributes:attrtitle];
        NSAttributedString *astringrecomm = [[NSAttributedString alloc] initWithString:recommcompund attributes:attrrecomm];
        
        NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
        [mut appendAttributedString:astringtitle];
        [mut appendAttributedString:astringrecomm];
        
        CGFloat width = self.bounds.size.width;
        CGFloat margin = recommmaringhr + recommmaringhr;
        CGFloat remain = width - margin;
        CGSize stringmaxsize = CGSizeMake(remain, 1000);
        CGFloat height = ceilf([mut boundingRectWithSize:stringmaxsize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
        
        UILabel *label = [[UILabel alloc] init];
        [label setUserInteractionEnabled:NO];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        [label setNumberOfLines:0];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setAttributedText:mut];
        self.label = label;
        
        [self addSubview:label];
        
        NSDictionary *views = @{@"label":label, @"bar":self.bar};
        NSDictionary *metrics = @{@"margin":@(recommmaringhr), @"top":@(recommmargintop), @"height":@(height)};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[label]-(margin)-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-(top)-[label(height)]" options:0 metrics:metrics views:views]];
    }
}

@end