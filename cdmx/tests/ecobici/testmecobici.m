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

-(void)testparseallstations
{
    NSArray<mdbecobicistation*> *stations = [mdbselect ecobicistations];
    NSInteger totalstations = stations.count;
    NSInteger parsedstations = self.model.items.count;
    
    XCTAssertEqual(totalstations, parsedstations, @"Didn't parsed all the stations");
}

-(void)teststationshavename
{
    for(mecobiciitem *station in self.model.items)
    {
        XCTAssertNotNil(station.name, @"Station doesn't have a name");
    }
}

@end