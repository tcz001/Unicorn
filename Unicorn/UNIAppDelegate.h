//
//  UNIAppDelegate.h
//  Unicorn
//
//  Created by Fan Jiang on 6/16/14.
//  Copyright (c) 2014 wejoin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HGBeaconScanner.h"
#import "HGBeacon.h"
#import "ReactiveCocoa/ReactiveCocoa.h"
#import "BlocksKit.h"
#import "EXTScope.h"
#import <Foundation/Foundation.h>

@interface UNIAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSMenu *statusMenu;
@property (strong, nonatomic) NSStatusItem *statusBar;
@property (weak) IBOutlet NSForm *unicornForm;
@property (strong) RACSignal *housekeepingSignal;
- (IBAction)bringtofront:(id)sender;
@end
