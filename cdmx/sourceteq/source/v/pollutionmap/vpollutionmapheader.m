#import "vpollutionmapheader.h"
#import "efont.h"

static NSInteger const maxfractionskm = 1;

@implementation vpollutionmapheader
{
    BOOL denied;
}

-(instancetype)init
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    denied = NO;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont regularsize:13]];
    [label setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [label setNumberOfLines:0];
    [label setText:NSLocalizedString(@"vpollution_map_header_loading", nil)];
    self.label = label;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont regularsize:13]];
    [labeltitle setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [labeltitle setText:NSLocalizedString(@"vpollution_map_header_closer", nil)];
    [labeltitle setHidden:YES];
    self.labeltitle = labeltitle;
    
    UILabel *labelkm = [[UILabel alloc] init];
    [labelkm setBackgroundColor:[UIColor clearColor]];
    [labelkm setUserInteractionEnabled:NO];
    [labelkm setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelkm setTextAlignment:NSTextAlignmentCenter];
    [labelkm setFont:[UIFont regularsize:17]];
    [labelkm setTextColor:[UIColor blackColor]];
    self.labelkm = labelkm;
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setClipsToBounds:YES];
    [border setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    
    [self addSubview:labeltitle];
    [self addSubview:label];
    [self addSubview:labelkm];
    [self addSubview:border];
    
    NSDictionary *views = @{@"label":label, @"km":labelkm, @"border":border, @"labeltitle":labeltitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[km]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-18-[km(19)]-(-2)-[labeltitle(15)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)deniedlocation
{
    denied = YES;
    [self.label setText:NSLocalizedString(@"vpollution_map_header_denied", nil)];
}

-(void)showlocation:(mpollutionmapitem*)model
{
    if(!denied)
    {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setMaximumFractionDigits:maxfractionskm];
        NSString *strkm = [NSString stringWithFormat:NSLocalizedString(@"vpollution_map_header_km", nil), [formatter stringFromNumber:@(model.kilometers)]];
        
        [self.label removeFromSuperview];
        [self.labelkm setText:strkm];
        
        if(model.closer)
        {
            [self.labeltitle setHidden:NO];
        }
        else
        {
            [self.labeltitle setHidden:YES];
        }
    }
}

@end