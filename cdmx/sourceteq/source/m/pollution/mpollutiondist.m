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
    
    mpollutiondistitemxochimilco *itemxochimilco = [[mpollutiondistitemxochimilco alloc] init];
    self.itemxochimilco = itemxochimilco;
    
    mpollutiondistitemalvaroobregon *itemalvaroobregon = [[mpollutiondistitemalvaroobregon alloc] init];
    self.itemalvaroobregon = itemalvaroobregon;
    
    mpollutiondistitemazcapozalco *itemazcapozalco = [[mpollutiondistitemazcapozalco alloc] init];
    self.itemazcapozalco = itemazcapozalco;
    
    mpollutiondistitemiztapalapa *itemiztapalapa = [[mpollutiondistitemiztapalapa alloc] init];
    self.itemiztapalapa = itemiztapalapa;
    
    mpollutiondistitemiztacalco *itemiztacalco = [[mpollutiondistitemiztacalco alloc] init];
    self.itemiztacalco = itemiztacalco;
    
    mpollutiondistitemtlalpan *itemtlalpan = [[mpollutiondistitemtlalpan alloc] init];
    self.itemtlalpan = itemtlalpan;
    
    mpollutiondistitemtlahuac *itemtlahuac = [[mpollutiondistitemtlahuac alloc] init];
    self.itemtlahuac = itemtlahuac;
    
    mpollutiondistitemmilpaalta *itemmilpaalta = [[mpollutiondistitemmilpaalta alloc] init];
    self.itemmilpaalta = itemmilpaalta;
    
    mpollutiondistitemmagdalenacontreras *itemmagdalenacontreras = [[mpollutiondistitemmagdalenacontreras alloc] init];
    self.itemmagdalenacontreras = itemmagdalenacontreras;
    
    mpollutiondistitemgustavoamadero *itemgustavoamadero = [[mpollutiondistitemgustavoamadero alloc] init];
    self.itemgustavoamadero = itemgustavoamadero;
    
    mpollutiondistitemcuajimalpa *itemcuajimalpa = [[mpollutiondistitemcuajimalpa alloc] init];
    self.itemcuajimalpa = itemcuajimalpa;
    
    mpollutiondistitemcuauhtemoc *itemcuauhtemoc = [[mpollutiondistitemcuauhtemoc alloc] init];
    self.itemcuauhtemoc = itemcuauhtemoc;
    
    mpollutiondistitemvenustianocarranza *itemvenustianocarranza = [[mpollutiondistitemvenustianocarranza alloc] init];
    self.itemvenustianocarranza = itemvenustianocarranza;
    
    mpollutiondistitemmiguelhidalgo *itemmiguelhidalgo = [[mpollutiondistitemmiguelhidalgo alloc] init];
    self.itemmiguelhidalgo = itemmiguelhidalgo;
    
    self.items = @[
                   itemalvaroobregon,
                   itemazcapozalco,
                   itembenitojuarez,
                   itemcoyoacan,
                   itemcuajimalpa,
                   itemcuauhtemoc,
                   itemgustavoamadero,
                   itemiztacalco,
                   itemiztapalapa,
                   itemmagdalenacontreras,
                   itemmiguelhidalgo,
                   itemmilpaalta,
                   itemtlahuac,
                   itemtlalpan,
                   itemvenustianocarranza,
                   itemxochimilco,
                   ];
    
    return self;
}

@end