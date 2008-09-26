//
//  PathAppDelegate.m
//  Path
//
//  Created by luis on 26/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "PathAppDelegate.h"

@implementation PathAppDelegate

@synthesize window;
@synthesize pathView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window addSubview:pathView];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
