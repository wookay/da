//
//  TestViewController.h
//  touch
//
//  Created by luis on 14/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
  NSDictionary* testBuilder;
}

- (void) setTitle:(id)title builder:(NSDictionary*)builder ;

@end

