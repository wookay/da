// commenter_list.h
//                           wookay.noh at gmail.com

#import "base.h"

@interface CommenterList : Base <NSFastEnumeration> {
}

- (NSArray*) plus ;
- (NSArray*) minus ;
- (NSArray*) map_people:(id)xpath ;

@end
