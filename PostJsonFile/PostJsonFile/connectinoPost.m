//
//  connectinoPost.m
//  PostJsonFile
//
//  Created by Jeek Yuan on 2018/5/12.
//  Copyright © 2018 Jeek Yuan. All rights reserved.
//

#import "connectinoPost.h"

@implementation connectinoPost
@synthesize array,response,data,task;
- (instancetype)init
{
	self = [super init];
	if (self) {
		data=nil;
		task=nil;
		response=nil;
		array=[[NSMutableArray alloc]init];
	}
	return self;
}

-(void)sendRequest:(NSString*)url withBody:(NSString*)body{
	NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:[[NSURL alloc]initWithString:url]];
	NSMutableString *requestBody=[[NSMutableString alloc]initWithString:body];
	NSData *requestData=[NSData dataWithBytes:[requestBody UTF8String] length:[requestBody length]];
	[request setHTTPMethod:@"POST"];
	[request setValue:@"XXX" forHTTPHeaderField:@"content-type"];
	[request setValue:@"my mac" forHTTPHeaderField:@"user-agent"];
	[request setHTTPBody:requestData];
	NSURLSession *session=[NSURLSession sharedSession];
	NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		self.data=data;
		self.response=response;
		[self.array addObject:self.data];
		[self.array addObject:self.response];
	}];
	self.task=task;
}

-(NSArray *)run{
	[self.task resume];
	return self.array;
}
@end
