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
