// Base.h
//                           wookay.noh at gmail.com

#import "config.h"
#import <Foundation/NSString.h>
#import <Foundation/NSXMLDocument.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSURLRequest.h>
#import <Foundation/NSURLResponse.h>
#import <Foundation/NSURLConnection.h>
#import <Foundation/NSURL.h>
#import <Foundation/NSException.h>

@interface Base : NSObject {
  NSString* raw_data;
  NSString* resource;
}

@property (nonatomic, retain) NSString* raw_data;
@property (nonatomic, retain) NSString* resource;

- (id) raw_data:(id)resource;

- (id) items:(id)xpath ;
- (id) item:(id)xpath ;
- (id) nodes:(id)xpath xml:(id)xml ;
- (id) element:(id)xpath ;

@end
