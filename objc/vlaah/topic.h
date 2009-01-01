// topic.h
//                           wookay.noh at gmail.com

#import "base.h"
#import "unit.h"

@interface Topic : Base {
  NSString* name;
}

@property (nonatomic, retain) NSString* name;

+ (id) find:(id)name ;
- (id) normalized_name ;
- (id) usual_name ;
- (id) comments ;
- (id) commenters ;

- (Unit*) degree ;
- (Unit*) people ;
- (Unit*) percent ;

@end
