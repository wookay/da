//
//  TestViewController.m
//  touch
//
//  Created by luis on 14/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "TestViewController.h"
#import "../../fun/Ord.h"

@implementation TestViewController

+ (id) create:(id)title withBuilder:(NSArray*)builder {
  id view = [[self alloc] init];
  [view setTitle:title];
  [view setValue:[OrderedDictionary dictionaryWithObjectsAndKeysFromArray:builder] forKey:@"testBuilder"];
  return view;
}

- (void)dealloc {
  [testBuilder release];
	[super dealloc];
}

- (void) loadView {
	UITableView* myTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];	
	myTableView.delegate = self;
	myTableView.dataSource = self;
	myTableView.autoresizesSubviews = YES;
	self.view = myTableView;	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [[testBuilder allKeys] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [[testBuilder allKeys] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  id key = [[testBuilder allKeys] objectAtIndex:section];
  return [[testBuilder valueForKey:key] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger section = [indexPath section];
  NSInteger row = [indexPath row];
  NSString* iden = [NSString stringWithFormat:@"%d %d", section, row];
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
	if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:iden] autorelease];
    id key = [[testBuilder allKeys] objectAtIndex:section];
    NSArray* ary = [[testBuilder valueForKey:key] objectAtIndex:row];
    BOOL success = [[ary objectAtIndex:0] boolValue];
    NSString* text = [NSString stringWithFormat:@"%@", [ary objectAtIndex:1]];
    if (! success) {
      cell.textColor = [UIColor redColor];
      text = [text stringByAppendingFormat:@", %@", [ary objectAtIndex:2]];
    }
    cell.text = [text stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
	}
  cell.font = [UIFont systemFontOfSize:12];  
	return cell;
}

@end