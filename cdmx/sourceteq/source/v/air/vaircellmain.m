#import "vaircellmain.h"
#import "mstations.h"
#import "uifont+uifontmain.h"

@implementation vaircellmain

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
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
    
    [self addSubview:label];
    [self addSubview:icontemp];
    [self addSubview:iconhum];
    
    NSDictionary *views = @{@"icontemp":icontemp, @"iconhum":iconhum, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icontemp(20)]-100-[iconhum(20)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[icontemp(30)]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[iconhum(25)]-101-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config
{
    if([mstations singleton].uv)
    {
        NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
        
        NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont boldsize:17], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.7]};
        NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont regularsize:14], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
        NSString *stringtitle = [mstations singleton].uv.title;
        NSString *stringdescr = [mstations singleton].uv.descr;
        NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dicttitle];
        NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:stringdescr attributes:dictdescr];
        [mut appendAttributedString:attrtitle];
        [mut appendAttributedString:attrdescr];
        
        [self.label setAttributedText:mut];
    }
}

@end