#import "mstationsnodrivehologram.h"
#import "mstationsnodrivehologramfree.h"
#import "mstationsnodrivehologramdoubleo.h"
#import "mstationsnodrivehologramo.h"
#import "mstationsnodrivehologramonce.h"
#import "mstationsnodrivehologramtwice.h"

@implementation mstationsnodrivehologram

+(instancetype)hologramforstring:(NSString*)rawstring
{
    mstationsnodrivehologram *hologram;
    
    if([rawstring isEqualToString:@"exento"])
    {
        hologram = [[mstationsnodrivehologramfree alloc] init];
    }
    else if([rawstring isEqualToString:@"00"])
    {
        hologram = [[mstationsnodrivehologramdoubleo alloc] init];
    }
    else if([rawstring isEqualToString:@"0"])
    {
        hologram = [[mstationsnodrivehologramo alloc] init];
    }
    else if([rawstring isEqualToString:@"1"])
    {
        hologram = [[mstationsnodrivehologramonce alloc] init];
    }
    else if([rawstring isEqualToString:@"2"])
    {
        hologram = [[mstationsnodrivehologramtwice alloc] init];
    }
    
    return hologram;
}

@end