//
//  UNIAppDelegate.m
//  Unicorn
//
//  Created by Fan Jiang on 6/16/14.
//  Copyright (c) 2014 wejoin. All rights reserved.
//

#import "UNIAppDelegate.h"
#import "HGDateValueTransformer.h"
@implementation UNIAppDelegate
@synthesize statusBar = _statusBar;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSForm *uniform = self.unicornForm;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    uniform.stringValue = [userDefaults stringForKey:@"unicorn_id"];
    self.housekeepingSignal = [RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]];
    [self.housekeepingSignal subscribeNext:^(NSDate *now) {
        if ([[HGBeaconScanner sharedBeaconScanner] scanning]) {
            [userDefaults setObject:uniform.stringValue forKey:@"unicorn_id"];
            [HGBeaconScanner sharedBeaconScanner].unicorn_id = [[uniform cellAtIndex:0]stringValue];
        }
    }];

}

- (void) awakeFromNib {
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
//    self.statusBar.title = @"G";
    
    // you can also set an image
    self.statusBar.image = [NSImage imageNamed : @"StatusIcon"];
    
    self.statusBar.menu = self.statusMenu;
    self.statusBar.highlightMode = YES;
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag{
    return YES;
}

@end
