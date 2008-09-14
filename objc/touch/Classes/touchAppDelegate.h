//
//  touchAppDelegate.h
//  touch
//
//  Created by luis on 14/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface touchAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IBOutlet UINavigationController	*navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;

@end

