//
//  UNIEngagement.m
//  Unicorn
//
//  Created by Fan Jiang on 7/17/14.
//  Copyright (c) 2014 wejoin. All rights reserved.
//

#import "UNIEngagement.h"
#import "UNIEngageResponse.h"
#import "libextobjc/EXTScope.h"
#import "BlocksKit.h"

@implementation UNIEngagement
- (id)initWithProximityUUID:(NSString *)proximityUUID major:(NSNumber *)major minor:(NSNumber *)minor measuredPower:(NSNumber *)power unicorn_id:(NSString *)unicorn_id {
    self = [super init];
    
    if (self) {
        self.UUID = proximityUUID;
        self.major = major;
        self.minor = minor;
        self.measuredPower = power;
        self.unicorn_id = unicorn_id;
        self.lastUpdated = [NSDate date];
    }
    return self;
}
+ (UNIEngagement *)buildEngagement:(HGBeacon *)beacon unicorn_id:(NSString *)unicorn_id
{
    UNIEngagement *engagement = [[UNIEngagement alloc] initWithProximityUUID:beacon.proximityUUID.UUIDString major:beacon.major minor:beacon.minor measuredPower:beacon.measuredPower unicorn_id:unicorn_id];
    return engagement;
}
+ (void)sendEngageToUnicorn:(UNIEngagement *)engagement
{
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://unicorn-service.herokuapp.com"]];
    //For local test:
    //RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost:3000"]];

    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[UNIEngageResponse class]];
    [responseMapping addAttributeMappingsFromArray:@[@"beacon_id", @"unicorn_id", @"created_at", @"updated_at"]];
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful); // Anything in 2xx
    RKResponseDescriptor *engagementDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping method:RKRequestMethodAny pathPattern:@"/engage" keyPath:@"" statusCodes:statusCodes];
    
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping]; // objectClass == NSMutableDictionary
    [requestMapping addAttributeMappingsFromArray:@[@"UUID", @"major", @"minor", @"unicorn_id"]];
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:requestMapping objectClass:[UNIEngagement class] rootKeyPath:@"engage" method:RKRequestMethodAny];
    
    [objectManager addRequestDescriptor:requestDescriptor];
    [objectManager addResponseDescriptor:engagementDescriptor];
    
    // POST to create
    RKObjectRequestOperation *objectRequestOperation = [objectManager appropriateObjectRequestOperationWithObject:engagement method:RKRequestMethodPOST path:@"/engage" parameters:nil];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"Load collection of engage: %@", mappingResult.array);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Operation failed with error: %@", error);
    }];
    [objectRequestOperation start];
}
@end
