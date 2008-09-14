//
//  MainViewController.h
//  touch
//
//  Created by luis on 14/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
	NSMutableArray	 		  *menuList;
	IBOutlet UITableView	*myTableView;
}

@property (nonatomic, retain) UITableView *myTableView;

@end
