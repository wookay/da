// me2day.h
//                           wookay.noh at gmail.com

#import <Foundation/NSObject.h>

@interface Me2day : NSObject {
  id username;
  id userkey;
}

@property (nonatomic, retain) id username;
@property (nonatomic, retain) id userkey;

- (id) username:(id)_username userkey:(id)_userkey ;
- (id) basicAuth ;
- (id) requestAuth:(id)api ;
- (id) requestAuth:(id)api body:(NSString*)body ;
- (id) request:(id)api ;
- (id) request:(id)api body:(id)body ;
- (id) requesting:(id)api body:(NSString*)body auth:(BOOL)auth ;
- (id) requesting:(id)api body:(NSString*)body auth:(BOOL)auth multipart:(id)attachment ;

- (id) get_comments:(id)post_id ;
- (id) track_comments:(id)username ;
- (id) get_person:(id)_username ;
- (id) get_metoos:(id)post_id ;
- (id) get_friends:(id)_username ;
- (id) get_friends:(id)_username scope:(id)scope ;
- (id) get_friends:(id)_username user_of:(id)user_of ;
- (id) get_tags:(id)_username ;

- (id) get_posts:(id)_username ;
- (id) get_posts:(id)_username count:(int)count ;
- (id) get_posts:(id)_username count:(int)count offset:(int)offset ;
- (id) get_posts:(id)_username count:(int)count from:(id)from ;
- (id) get_posts:(id)_username count:(int)count tag:(id)tag ;
- (id) get_post:(id)post_id ;

// auth
- (id) create_post:(id)body ;
- (id) create_post:(id)body tags:(id)tags ;
- (id) create_post:(id)body tags:(id)tags icon:(int)icon ;
- (id) create_post:(id)body tags:(id)tags icon:(int)icon close_comment:(id)close_comment ;
- (id) create_post:(id)body tags:(id)tags icon:(int)icon close_comment:(id)close_comment receive_sms:(id)receive_sms ;
- (id) create_post:(id)body tags:(id)tags attachment:(id)attachment ;
- (id) create_post:(id)body tags:(id)tags callback_url:(id)callback_url content_type:(id)content_type ;
- (id) create_post:(id)body tags:(id)tags icon:(int)icon longitude:(float)longitude latitude:(float)latitude ;
- (id) create_comment:(id)post_id body:(id)body ;
- (id) delete_comment:(id)comment_id ;
- (id) get_settings ;
- (id) noop ;

@end
