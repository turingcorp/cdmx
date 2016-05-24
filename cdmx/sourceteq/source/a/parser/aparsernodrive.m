#import "aparsernodrive.h"

@interface aparsernodrive ()

@property(strong, nonatomic, readwrite)mnodrive *nodrive;

@end

@implementation aparsernodrive

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        self.nodrive = [[mnodrive alloc] init:self.validjson];
    }
}

@end