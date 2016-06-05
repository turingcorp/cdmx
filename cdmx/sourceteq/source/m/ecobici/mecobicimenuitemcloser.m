#import "mecobicimenuitemcloser.h"

@interface mecobicimenuitem ()

@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mecobicimenuitemcloser

-(instancetype)init
{
    self = [super init];
    self.asset = @"ecobici_closer";
    
    return self;
}

#pragma mark -
#pragma mark ecobici menu item

-(void)action:(cecobici*)controller
{
    [controller centercloserstation];
}

@end