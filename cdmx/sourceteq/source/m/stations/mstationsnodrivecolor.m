#import "mstationsnodrivecolor.h"
#import "uicolor+uicolormain.h"

@implementation mstationsnodrivecolor

-(instancetype)init:(NSString*)rawcolor
{
    self = [super init];

    if([rawcolor isEqualToString:@"amarillo"])
    {
        self.color = [UIColor pollution_yellow];
    }
    else if([rawcolor isEqualToString:@"rosa"])
    {
        self.color = [UIColor pollution_yellow];
    }
    else if([rawcolor isEqualToString:@"rojo"])
    {
        
    }
    else if([rawcolor isEqualToString:@"verde"])
    {
        
    }
    else if([rawcolor isEqualToString:@"azul"])
    {
        
    }
    
    return self;
}

@end