#import <XCTest/XCTest.h>
#import "teststools.h"
#import "aparserpollution.h"
#import "mdbupdate.h"

@interface aparserpollution ()

-(NSArray<mdbdistrict*>*)parsedistricts:(NSArray*)rawdistricts;

@end

@interface testaparserpollution:XCTestCase

@property(strong, nonatomic)aparserpollution *parser;
@property(strong, nonatomic)NSDictionary *pollutionmockup;

@end

@implementation testaparserpollution

-(void)setUp
{
    [super setUp];
    
    self.parser = [[aparserpollution alloc] init];
    self.pollutionmockup = [teststools loadmock:@"mockpollution_common"];
}

-(void)tearDown
{
    [super tearDown];
    self.pollutionmockup = nil;
}

-(void)testparsedistricts
{
    NSArray *rawdistricts = self.pollutionmockup[@"districts"];
    NSArray<mdbdistrict*> *districts = [self.parser parsedistricts:rawdistricts];
    XCTAssertEqual(districts.count, 16, @"Different number of districsts");
}
/*
- (void)testPerformanceExample
{
    [self measureBlock:
     ^{
        
    }];
}
*/
@end