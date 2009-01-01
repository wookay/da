// unit.h
//                           wookay.noh at gmail.com

#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>

@interface Unit : NSObject {
  float total;
  float plus;
  float minus;
}

@property (nonatomic) float total;
@property (nonatomic) float plus;
@property (nonatomic) float minus;

- (id) initWithElement:(id)element ;

@end
