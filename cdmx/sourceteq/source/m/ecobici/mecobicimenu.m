#import "mecobicimenu.h"

@interface mecobicimenu ()

@property(strong, nonatomic, readwrite)NSArray<mecobicimenuitem*> *items;

@end

@implementation mecobicimenu

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [mecobicimenuitem menu],
                   [mecobicimenuitem user],
                   [mecobicimenuitem closer]
                   ];
    
    return self;
}

@end