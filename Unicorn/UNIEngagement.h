//
//  UNIEngagement.h
//  Unicorn
//
//  Created by Fan Jiang on 7/17/14.
//  Copyright (c) 2014 wejoin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UNIEngagement : NSObject

@property (strong,nonatomic) NSString *UUID;
//uint16_t minor;@property (assign,nonatomic) uint16_t major;
@property (strong,nonatomic) NSNumber *major;
//@property (assign,nonatomic) uint16_t minor;
@property (strong,nonatomic) NSNumber *minor;
//@property (assign,nonatomic) int8_t measuredPower;
@property (strong,nonatomic) NSNumber *measuredPower;
@property (strong,nonatomic) NSNumber *RSSI;
@property (strong,nonatomic) NSDate *lastUpdated;
@property (strong,nonatomic) NSString *unicorn_id;
- (id)initWithProximityUUID:(NSString *)UUID
                      major:(NSNumber *)major
                      minor:(NSNumber *)minor
              measuredPower:(NSNumber *)power
                 unicorn_id:(NSString *)unicorn_id;
@end
