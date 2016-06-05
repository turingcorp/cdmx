#import <XCTest/XCTest.h>
#import "teststools.h"
#import "aparseradminecobici.h"

@interface testaparseradminecobici:XCTestCase

@property(strong, nonatomic)aparseradminecobici *parser;
@property(strong, nonatomic)NSDictionary *adminecobicimockup;

@end

@implementation testaparseradminecobici

-(void)setUp
{
    [super setUp];
    
    self.parser = [[aparseradminecobici alloc] init];
    self.adminecobicimockup = [teststools loadmock:@"mockadminecobici_common"];
}

-(void)tearDown
{
    self.parser = nil;
    self.adminecobicimockup = nil;
    
    [super tearDown];
}

-(void)testparseallstations
{
    [self.parser parse:self.adminecobicimockup];
    NSInteger totalstations = self.parser.stations.count;
    
    XCTAssertEqual(totalstations, 50, @"Didn't parse all the stations");
}

-(void)testparsestation
{
    NSArray *jsonasarray = (NSArray*)self.adminecobicimockup;
    NSDictionary *jsonelement = jsonasarray[0];
    madminecobicistation *station = [[madminecobicistation alloc] init:jsonelement];
    NSInteger stationid = station.stationid.integerValue;
    NSInteger stationnamelength = station.name.length;
    
    XCTAssertGreaterThan(stationid, 0, @"Error parsing station id");
    XCTAssertGreaterThan(stationnamelength, 0, @"Error parsing station name");
    XCTAssertNotNil(station.latitude, @"Error parsing latitude");
    XCTAssertNotNil(station.longitude, @"Error parsing longitude");
    XCTAssertNotEqual(station.latitude.floatValue, 0, @"Latitude parsing wrong");
    XCTAssertNotEqual(station.longitude.floatValue, 0, @"Longitude parsing wrong");
}

@end