//
//  MainViewController.m
//  touch
//
//  Created by luis on 14/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "MainViewController.h"
#import "TestViewController.h"
#import "../../unittest/UnitTest.h"

@implementation MainViewController

  @synthesize myTableView;

- (void) awakeFromNib {	
  id testTargets = [NSDictionary dictionaryWithObjectsAndKeys:
                    
    @"HelloTest",
    @"unittest",
                    
    @"DataTypesTest NSExpressionTest NSArrayTest NSBundleTest NSDataTest NSDateTest NSErrorTest NSMutableArrayTest NSMutableDictionaryTest NSMutableSetTest NSNotificationTest NSNumberTest NSObjectTest NSProcessInfoTest NSStringTest",
    @"foundation",
    
    @"VectorTest MatrixTest",
    @"math",
    
    @"HashTest ArrayTest EnumerableTest NumericTest StringTest",
    @"fun",
                    
    @"HangulTest",
    @"hangul",
    
    @"CGContextTest",
    @"coregraphics",
                    
    @"UIWebViewTest",
    @"uikit",
                    
    nil];
  
  [self setValue:@"touch" forKey:@"title"];

  menuList = [[NSMutableArray alloc] init];
	
  for (id target in [testTargets allKeys]) {
    UnitTest* unittest = [UnitTest createBuilder];
    for (id test in [[testTargets valueForKey:target] componentsSeparatedByString:@" "]) {
      [unittest run:test];
    }
    TestViewController *testViewController = [[TestViewController alloc] init];
    [testViewController setTitle:target builder:[unittest builder]];
    
    NSString* title = [NSString stringWithFormat:@"%@ (%d", target, [unittest passedCount]];
    if ([unittest failedCount] > 0) {
      title = [title stringByAppendingFormat:@", %d", [unittest failedCount]];
    }    
    
    [menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                        [title stringByAppendingString:@")"], @"title",
                        testViewController,                   @"view",
                        unittest,                             @"unittest",
                        nil]];
	  [testViewController release];
  }
}

- (void) dealloc {
	[menuList release];
	[myTableView release];
	
	[super dealloc];
}

#pragma mark UITableView delegate methods
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	return UITableViewCellAccessoryDisclosureIndicator;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UIViewController *targetViewController = [[menuList objectAtIndex:indexPath.row] objectForKey:@"view"];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}

#pragma mark UITableView datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [menuList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger section = [indexPath section];
  NSInteger row = [indexPath row];
  NSString* iden = [NSString stringWithFormat:@"%d %d", section, row];
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:iden] autorelease];
	}
	
  NSDictionary* dic = [menuList objectAtIndex:indexPath.row];
	cell.text = [dic objectForKey:@"title"];

  UnitTest* unittest = [dic objectForKey:@"unittest"];
  if ([unittest failedCount] > 0) {
    cell.textColor = [UIColor redColor];
  }
  
	return cell;
}

@end