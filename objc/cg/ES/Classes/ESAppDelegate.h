//
//  ESAppDelegate.h
//  ES
//
//  Created by luis on 26/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAGLView;

@interface ESAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EAGLView *glView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EAGLView *glView;

@end

