#import "vpollutionrecommendation.h"
#import "cpollutionrecommendation.h"
#import "efont.h"
#import "ecolor.h"

@implementation vpollutionrecommendation

-(instancetype)init:(cpollutionrecommendation*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:controller.model.name];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont regularsize:17]];
    [label setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setFont:[UIFont boldsize:20]];
    [labeltitle setTextColor:[UIColor main]];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setText:controller.model.index.name];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *string = [controller.model.index recommendations];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [label setText:string];
                                          [welf addSubview:label];
                                          [welf addSubview:labeltitle];
                                          
                                          NSDictionary *views = @{@"label":label, @"bar":welf.bar, @"labeltitle":labeltitle};
                                          NSDictionary *metrics = @{};
                                          
                                          [welf addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
                                          [welf addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labeltitle]-10-|" options:0 metrics:metrics views:views]];
                                          [welf addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-15-[labeltitle(24)]-10-[label]" options:0 metrics:metrics views:views]];
                                      });
                   });
    
    return self;
}

@end