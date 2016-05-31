#import "mecobicimenuitemmenu.h"

@interface mecobicimenuitem ()

@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mecobicimenuitemmenu

-(instancetype)init
{
    self = [super init];
    self.asset = @"generic_menu";
    
    return self;
}

#pragma mark -
#pragma mark ecobici menu item

-(void)action:(cecobici*)controller
{
    [controller menu];
}

@end