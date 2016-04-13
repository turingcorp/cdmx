#import "mstationsnodriveplate.h"
#import "uicolor+uicolormain.h"

@implementation mstationsnodriveplate

-(instancetype)init:(NSString*)rawcolor
{
    self = [super init];
    
    if([rawcolor isEqualToString:@"amarillo"])
    {
        self.color = [UIColor pollution_yellow];
    }
    else if([rawcolor isEqualToString:@"rosa"])
    {
        self.color = [UIColor pollution_pink];
    }
    else if([rawcolor isEqualToString:@"rojo"])
    {
        self.color = [UIColor pollution_red];
    }
    else if([rawcolor isEqualToString:@"verde"])
    {
        self.color = [UIColor pollution_green];
    }
    else if([rawcolor isEqualToString:@"azul"])
    {
        self.color = [UIColor pollution_blue];
    }
    
    return self;
}

@end