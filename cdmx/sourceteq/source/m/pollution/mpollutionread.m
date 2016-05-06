#import "mpollutionread.h"

@implementation mpollutionread

+(instancetype)lastread
{
    mpollutionindex *index = [mpollutionindex points:10];
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