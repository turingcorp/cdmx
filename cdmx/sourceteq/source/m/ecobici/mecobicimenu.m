#import "mecobicimenu.h"

@interface mecobicimenu ()

@property(strong, nonatomic, readwrite)NSArray<mecobicimenuitem*> *items;

@end

@implementation mecobicimenu

+(instancetype)basicmenu
{
    mecobicimenu *model = [[mecobicimenu alloc] init:@[
                                                       [mecobicimenuitem menu],
                                                       [mecobicimenuitem closer]
                                                       ]];
    
    return model;
}

+(instancetype)completemenu
{
    mecobicimenu *model = [[mecobicimenu alloc] init:@[
                                                       [mecobicimenuitem menu],
                                                       [mecobicimenuitem user],
                                                       [mecobicimenuitem closer]
                                                       ]];
    
    return model;
}

-(instancetype)init:(NSArray<mecobicimenuitem*>*)items
{
    self = [super init];
    self.items = items;
    
    return self;
}

@end