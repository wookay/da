// me2day.m
//                           wookay.noh at gmail.com

#import "me2day.h"
#import "me2util.h"
#import "me2array.h"
#import "JSON/JSON.h"
#import "config.h"

#define NONCE  @"20090101"

@implementation Me2day

@synthesize username;
@synthesize userkey;

- (id) username:(id)_username userkey:(id)_userkey {
  self.username = _username;
  self.userkey = _userkey;
  return self;
}

- (id) basicAuth {
  id password = [NONCE stringByAppendingString:
    md5([NONCE stringByAppendingString:self.userkey])];
  NSData* data = [[NSString stringWithFormat:@"%@:%@", self.username, password]
    dataUsingEncoding:NSUTF8StringEncoding];
  return [@"Basic " stringByAppendingString:[data stringEncodedWithBase64]];
}

- (id) requestAuth:(id)api {
  return [self requestAuth:api body:nil];
}
- (id) requestAuth:(id)api body:(NSString*)body {
  return [self requesting:api body:body auth:true]; 
}

- (id) request:(id)api {
  return [self request:api body:nil];
}

- (id) request:(id)api body:(id)body {
  return [self requesting:api body:body auth:false]; 
}

- (id) requesting:(id)api body:(NSString*)body auth:(BOOL)auth {
  id urlString = [NSString stringWithFormat:@"http://me2day.net/api/%@.%@",
    api, @"json"];
  //NSLog(@"url %@", urlString);
  NSURL *url = [NSURL URLWithString:urlString];
  NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
  [request setHTTPMethod:@"POST"];
  if (auth) {
    [request addValue:APPKEY forHTTPHeaderField:@"me2_application_key"];
    [request addValue:[self basicAuth] forHTTPHeaderField:@"Authorization"];
  }
  if (nil != body) {
    NSString* escaped = [body stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData* bodyData = [escaped dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
  }
  if (LOCAL_TEST) {
    return NULL;
  } else {
    NSError *error;
    NSHTTPURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                     returningResponse:&response error:&error];
    if (data) {
      id ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
      if ([@"사용자아이디가 올바르지 않았습니다." isEqualToString:ret]) {
        //[NSException raise:@"ApplicationKeyError" format:@"Missing APPKEY"];
      } else {
        //NSLog(@"ret %@", ret);
        return [ret JSONValue];
      }
    }
  }
  return NULL;
}

- (id) get_comments:(id)post_id {
  id param = [NSString stringWithFormat:@"post_id=%@", post_id];
  return [self request:@"get_comments" body:param];
}

- (id) track_comments:(id)_username {
  id target = [NSString stringWithFormat:@"track_comments/%@", _username];
  return [self request:target];
}

- (id) get_person:(id)_username {
  id target = [NSString stringWithFormat:@"get_person/%@", _username];
  return [self request:target];
}

- (id) get_metoos:(id)post_id {
  id param = [NSString stringWithFormat:@"post_id=%@", post_id];
  return [self request:@"get_metoos" body:param];
}

- (id) get_friends:(id)_username {
  return [self get_friends:_username scope:@"all"];
}

- (id) get_friends:(id)_username scope:(id)scope {
  id target = [NSString stringWithFormat:@"get_friends/%@", _username];
  id param = [NSString stringWithFormat:@"scope=%@", scope];
  if ([[NSArray arrayWithObjects:@"all", @"close", @"family", nil] containsObject:scope]) {
    return [self request:target body:param];
  } else {
    return [self requestAuth:target body:param];
  }
}

- (id) get_friends:(id)_username user_of:(id)user_of {
  id target = [NSString stringWithFormat:@"get_friends/%@", _username];
  id param = [NSString stringWithFormat:@"user_of=%@", user_of];
  return [self requestAuth:target body:param];
}


// get_posts
- (id) get_posts:(id)_username {
  id target = [NSString stringWithFormat:@"get_posts/%@", _username];
  return [self request:target];
}

- (id) get_posts:(id)_username count:(int)count {
  id target = [NSString stringWithFormat:@"get_posts/%@", _username];
  id param = [NSString stringWithFormat:@"count=%d", count];
  return [self request:target body:param];
}

- (id) get_posts:(id)_username count:(int)count offset:(int)offset {
  id target = [NSString stringWithFormat:@"get_posts/%@", _username];
  id param = [NSString stringWithFormat:@"count=%d&offset=%d", count, offset];
  return [self request:target body:param];
}

- (id) get_posts:(id)_username count:(int)count from:(id)from {
  id target = [NSString stringWithFormat:@"get_posts/%@", _username];
  id param = [NSString stringWithFormat:@"count=%d&from=%@", count, from];
  return [self request:target body:param];
}

- (id) get_posts:(id)_username count:(int)count tag:(id)tag {
  id target = [NSString stringWithFormat:@"get_posts/%@", _username];
  id param = [NSString stringWithFormat:@"count=%d&tag=%@", count, tag];
  return [self request:target body:param];
}

- (id) get_post:(id)post_id {
  id target = [NSString stringWithFormat:@"get_posts/%@", @"_username"];
  id param = [NSString stringWithFormat:@"post_id=%@", post_id];
  return [[self request:target body:param] first];
}


- (void)dealloc {
  [username release];
  [userkey release];
  [super dealloc];
}

// Auth
- (id) create_comment:(id)post_id body:(id)body {
  id param = [NSString stringWithFormat:@"post_id=%@&body=%@", post_id, body];
  return [self requestAuth:@"create_comment" body:param];
}

- (id) delete_comment:(id)comment_id {
  id param = [NSString stringWithFormat:@"comment_id=%@", comment_id];
  return [self requestAuth:@"delete_comment" body:param];
}

- (id) get_settings {
  return [self requestAuth:@"get_settings"];
}

@end
