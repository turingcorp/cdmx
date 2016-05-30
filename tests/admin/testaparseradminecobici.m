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
    [super tearDown];
    
    self.parser = nil;
    self.adminecobicimockup = nil;
}

-(void)testparsestations
{
    [self.parser parse:self.adminecobicimockup];
    NSInteger totalstations = self.parser.stations.count;
    
    XCTAssertEqual(totalstations, 50, @"Didn't parse all the stations");
}

@end