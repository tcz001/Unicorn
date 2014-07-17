//
//  UNIEngageResponse.h
//  Unicorn
//
//  Created by Fan Jiang on 7/17/14.
//  Copyright (c) 2014 wejoin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UNIEngageResponse : NSObject

@property (strong,nonatomic) NSString *beacon_id;
@property (strong,nonatomic) NSString *unicorn_id;
@property (strong,nonatomic) NSString *created_at;
@property (strong,nonatomic) NSString *updated_at;

@end
