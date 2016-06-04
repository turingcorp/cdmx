#import <XCTest/XCTest.h>
#import "mdbselect.h"

@interface testmdbselect:XCTestCase

@end

@implementation testmdbselect

-(void)testecobicistations
{
    NSArray<mdbecobicistation*> *stations = [mdbselect ecobicistations];
    
    for(mdbecobicistation *station in stations)
    {
        CGFloat latitude = station.latitude.floatValue;
        CGFloat longitude = station.longitude.floatValue;
        
        XCTAssertNotNil(station.name, @"Station without a name");
        XCTAssertNotNil(station.primarykey, @"Station without a primarykey");
        XCTAssertNotNil(station.stationid, @"Station without a stationid");
        XCTAssertNotNil(station.latitude, @"Station without a latitude");
        XCTAssertNotNil(station.longitude, @"Station without a longitude");
        XCTAssertNotEqual(latitude, 0, @"Wrong station latitude");
        XCTAssertNotEqual(longitude, 0, @"Wrong station longitude");
    }
}

@end