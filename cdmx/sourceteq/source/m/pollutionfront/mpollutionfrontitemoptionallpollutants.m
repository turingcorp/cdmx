#import "mpollutionfrontitemoptionallpollutants.h"
#import "mpollutionfront.h"

@implementation mpollutionfrontitemoptionallpollutants

-(instancetype)init:(mpollutionfront*)model
{
    self = [super init];
    self.name = NSLocalizedString(@"vpollution_front_header_button_allpollutants", nil);
    
    return self;
}

@end