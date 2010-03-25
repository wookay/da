#import "NSArraySortByMostFrequent.h"

@implementation NSArray (SortByMostFrequent)

-(NSArray*) sortByMostFrequent {
	NSMutableDictionary* frequencyDict = [NSMutableDictionary dictionary];
	for (id obj in self) {
		int frequency = [[frequencyDict valueForKey:obj] intValue];
		[frequencyDict setValue:[NSNumber numberWithInt:frequency+1] forKey:obj];
	}
	NSMutableArray* ary = [NSMutableArray arrayWithCapacity:self.count];
	for (id obj in self) {
		[ary addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						obj, @"Object",
						[frequencyDict valueForKey:obj], @"Frequency",
						nil]];
	}
	NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Frequency" ascending:NO];
	[ary sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
	[sortDescriptor release];
	return [ary valueForKey:@"Object"];
}

@end
