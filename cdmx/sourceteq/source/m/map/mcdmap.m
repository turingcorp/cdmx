#import "mcdmap.h"
#import "mcdmapitemgam.h"
#import "mcdmapitemazc.h"
#import "mcdmapitemven.h"
#import "mcdmapitemcuau.h"
#import "mcdmapitemmh.h"
#import "mcdmapitemiztaca.h"
#import "mcdmapitembj.h"
#import "mcdmapitemalv.h"
#import "mcdmapitemcuaji.h"
#import "mcdmapitemcoyo.h"
#import "mcdmapitemiztapa.h"
#import "mcdmapitemtlahu.h"
#import "mcdmapitemxochi.h"
#import "mcdmapitemtlal.h"
#import "mcdmapitemmag.h"
#import "mcdmapitemmilp.h"

@implementation mcdmap

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[mcdmapitemgam alloc] init],
                   [[mcdmapitemazc alloc] init],
                   [[mcdmapitemven alloc] init],
                   [[mcdmapitemcuau alloc] init],
                   [[mcdmapitemmh alloc] init],
                   [[mcdmapitemiztaca alloc] init],
                   [[mcdmapitembj alloc] init],
                   [[mcdmapitemalv alloc] init],
                   [[mcdmapitemcuaji alloc] init],
                   [[mcdmapitemcoyo alloc] init],
                   [[mcdmapitemiztapa alloc] init],
                   [[mcdmapitemtlahu alloc] init],
                   [[mcdmapitemxochi alloc] init],
                   [[mcdmapitemtlal alloc] init],
                   [[mcdmapitemmag alloc] init],
                   [[mcdmapitemmilp alloc] init]
                   ];
    
    return self;
}

@end