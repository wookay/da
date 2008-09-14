//
//  touchAppDelegate.m
//  touch
//
//  Created by luis on 14/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "touchAppDelegate.h"
#import "MainViewController.h"

@implementation touchAppDelegate

  @synthesize window, navigationController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window addSubview: navigationController.view];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [navigationController release];
    [window release];
    [super dealloc];
}

@end