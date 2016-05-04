#import "mpollutiondist.h"
#import "mpollutiondistitembenitojuarez.h"
#import "mpollutiondistitemcoyoacan.h"
#import "mpollutiondistitemxochimilco.h"
#import "mpollutiondistitemalvaroobregon.h"
#import "mpollutiondistitemazcapozalco.h"
#import "mpollutiondistitemiztapalapa.h"
#import "mpollutiondistitemiztacalco.h"
#import "mpollutiondistitemtlalpan.h"
#import "mpollutiondistitemtlahuac.h"
#import "mpollutiondistitemmilpaalta.h"
#import "mpollutiondistitemmagdalenacontreras.h"
#import "mpollutiondistitemgustavoamadero.h"
#import "mpollutiondistitemcuajimalpa.h"
#import "mpollutiondistitemcuauhtemoc.h"
#import "mpollutiondistitemvenustianocarranza.h"
#import "mpollutiondistitemmiguelhidalgo.h"

@implementation mpollutiondist

-(instancetype)init
{
    self = [super init];
    
    mpollutiondistitembenitojuarez *itembenitojuarez = [[mpollutiondistitembenitojuarez alloc] init];
    self.itembenitojuarez = itembenitojuarez;
    
    mpollutiondistitemcoyoacan *itemcoyoacan = [[mpollutiondistitemcoyoacan alloc] init];
    self.itemcoyoacan = itemcoyoacan;
    
    self.items = @[
                   itembenitojuarez,
                   itemcoyoacan
                   ];
    
    return self;
}

@end