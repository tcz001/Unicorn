//
//  UNIEngagement.m
//  Unicorn
//
//  Created by Fan Jiang on 7/17/14.
//  Copyright (c) 2014 wejoin. All rights reserved.
//

#import "UNIEngagement.h"

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

@end
