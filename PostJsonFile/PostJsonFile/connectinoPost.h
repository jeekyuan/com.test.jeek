//
//  connectinoPost.h
//  PostJsonFile
//
//  Created by Jeek Yuan on 2018/5/12.
//  Copyright © 2018 Jeek Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface connectinoPost : NSObject<NSURLConnectionDelegate,NSURLConnectionDataDelegate>{
	NSMutableArray *array;
	NSData *data;
	NSURLResponse *response;
	NSURLSessionTask *task;
}
@property NSMutableArray *array;
@property NSData *data;
@property NSURLResponse *response;
@property NSURLSessionTask *task;
-(void)sendRequest:(NSString*)url withBody:(NSString*)body;
-(NSArray *)run;
@end
