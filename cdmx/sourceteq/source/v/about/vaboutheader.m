#import "vaboutheader.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

@implementation vaboutheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setUserInteractionEnabled:NO];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setFont:[UIFont regularsize:38]];
    [labeltitle setTextColor:[UIColor main]];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setText:NSLocalizedString(@"app_name", nil)];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:labeltitle];
    
    NSDictionary *views = @{@"title":labeltitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[title(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end