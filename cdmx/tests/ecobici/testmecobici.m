#import <XCTest/XCTest.h>
#import "mecobici.h"
#import "mdbselect.h"

@interface testmecobici:XCTestCase

@property(strong, nonatomic)mecobici *model;

@end

@implementation testmecobici

-(void)setUp
{
    [super setUp];
    NSArray<mdbecobicistation*> *stations = [mdbselect ecobicistations];
    self.model = [[mecobici alloc] init:stations];
}

-(void)tearDown
{
    self.model = nil;
    
    [super tearDown];
}

@end