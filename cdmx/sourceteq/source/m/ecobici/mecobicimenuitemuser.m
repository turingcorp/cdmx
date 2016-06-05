#import "mecobicimenuitemuser.h"

@interface mecobicimenuitem ()

@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mecobicimenuitemuser

-(instancetype)init
{
    self = [super init];
    self.asset = @"ecobici_me";
    
    return self;
}

#pragma mark -
#pragma mark ecobici menu item

-(void)action:(cecobici*)controller
{
    [controller centeruser];
}

@end