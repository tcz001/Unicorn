//
//  UNIAppDelegate.h
//  Unicorn
//
//  Created by Fan Jiang on 6/16/14.
//  Copyright (c) 2014 wejoin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface UNIAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSMenu *statusMenu;
@property (strong, nonatomic) NSStatusItem *statusBar;
@end
