//
//  TestViewController.h
//  touch
//
//  Created by luis on 14/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
  id testBuilder;
}

+ (id) create:(id)title withBuilder:(NSArray*)builder ;

@end

