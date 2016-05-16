#import "mpollutionfrontitemoptionrecommendation.h"

@implementation mpollutionfrontitemoptionrecommendation

-(instancetype)init:(mpollutionindex*)index
{
    self = [super init];
    self.name = NSLocalizedString(@"vpollution_front_header_button_recommendation", nil);
    
    return self;
}

@end