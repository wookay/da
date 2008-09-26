//
//  PathAppDelegate.h
//  Path
//
//  Created by luis on 26/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PathView.h"

@interface PathAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PathView *pathView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PathView *pathView;

@end