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

- (id) get_comments:(id)post_id ;
- (id) track_comments:(id)username ;
- (id) get_person:(id)_username ;
- (id) get_metoos:(id)post_id ;

- (id) get_posts:(id)_username ;
- (id) get_posts:(id)_username count:(int)count ;
- (id) get_posts:(id)_username count:(int)count offset:(int)offset ;
- (id) get_posts:(id)_username count:(int)count from:(id)from ;
- (id) get_posts:(id)_username count:(int)count tag:(id)tag ;
- (id) get_post:(id)post_id ;

// auth
- (id) create_comment:(id)post_id body:(id)body ;
- (id) delete_comment:(id)comment_id ;
- (id) get_settings ;

@end
