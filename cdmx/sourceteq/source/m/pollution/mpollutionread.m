#import "mpollutionread.h"

@interface mpollutionread ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionreaditem*> *items;

@end

@implementation mpollutionread

+(instancetype)load
{
    return nil;
}

+(instancetype)lastread
{
    mpollutionindex *index = [mpollutionindex points:170];
    mpollutionread *read = [[mpollutionread alloc] init];
    read.items = @[
                   [mpollutionreaditem global:index]
                   ];
    
    return read;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

@end