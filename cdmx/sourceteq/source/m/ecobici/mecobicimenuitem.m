#import "mecobicimenuitem.h"
#import "mecobicimenuitemmenu.h"
#import "mecobicimenuitemcloser.h"
#import "mecobicimenuitemuser.h"

@implementation mecobicimenuitem

+(instancetype)menu
{
    mecobicimenuitem *model = [[mecobicimenuitemmenu alloc] init];
    
    return model;
}

+(instancetype)closer
{
    mecobicimenuitem *model = [[mecobicimenuitemcloser alloc] init];
    
    return model;
}

+(instancetype)user
{
    mecobicimenuitem *model = [[mecobicimenuitemuser alloc] init];
    
    return model;
}

@end