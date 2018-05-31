//
//  main.m
//  PostJsonFile
//
//  Created by Jeek Yuan on 2018/5/12.
//  Copyright © 2018 Jeek Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "connectinoPost.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		connectinoPost *post=[[connectinoPost alloc]init];
		[post sendRequest:@"http://localhost:3000/foo/bar" withBody:@"I DEEPLY love annie"];
		NSArray *array=[post run];
		while(!post.data){
			NSLog(@"wait for response");
			[NSThread sleepForTimeInterval:3];
		}
		NSLog(@"data is: %@",[[NSString alloc]initWithData:array[0] encoding:NSUTF8StringEncoding]);
		NSHTTPURLResponse *res=(NSHTTPURLResponse*)array[1];
		NSLog(@"respons is: %@",res.allHeaderFields);
	}
	return 0;
}
