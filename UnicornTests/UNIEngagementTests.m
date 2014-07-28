//
//  UNIEngagementTests.m
//  Unicorn
//
//  Created by Fan Jiang on 7/28/14.
//  Copyright (c) 2014 wejoin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "UNIEngagement.h"


@interface UNIEngagementTests : XCTestCase

@end

@implementation UNIEngagementTests
HGBeacon *beaconAdvertisementData;

- (void)setUp {
    [super setUp];
    NSUUID *proximityUUID = [[NSUUID alloc]initWithUUIDString:@"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"];
    int major = 1000;
    int minor = 1;
    int measuredPower = 55;

    beaconAdvertisementData = [[HGBeacon alloc] initWithProximityUUID:proximityUUID
                                                                          major:[NSNumber numberWithUnsignedInteger:major]
                                                                          minor:[NSNumber numberWithUnsignedInteger:minor]
                                                                  measuredPower:[NSNumber numberWithShort:measuredPower]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    UNIEngagement *engagement = [UNIEngagement buildEngagement:beaconAdvertisementData unicorn_id:@"1"];
    [UNIEngagement sendEngageToUnicorn:engagement];
    // This is an example of a functional test case.
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        [UNIEngagement sendEngageToUnicorn:[UNIEngagement buildEngagement:beaconAdvertisementData unicorn_id:@"1"]];
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
