//
//  MyUrlCache.m
//
//  Created by linluxiang on 10-11-9.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyUrlCache.h"


@implementation MyUrlCache

@synthesize localcall;

- (id) initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)path {

	if (self = [super initWithMemoryCapacity:memoryCapacity diskCapacity:diskCapacity diskPath:path]) {
		localcall = [LocalCall new];
	}
	return self;

}

- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request {
	NSURL *url = [request URL];
	NSString *hoststring = [url host];
	NSString *pathstring = [url path];
	NSString *queryString = [[url query] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	if ([hoststring hasPrefix:@"localcall"]) {
		NSArray *query_array = [queryString componentsSeparatedByString: @"="];
		NSURLResponse *response = [[NSURLResponse alloc] init];
		NSCachedURLResponse *cachedResponse;
		if (query_array) {
			id object = [query_array lastObject];
			cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:[localcall dataForFunc:pathstring withArgument:object]];
		} else {
			cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:[localcall dataForFunc:pathstring withArgument:nil]];
		}
		
		//NSLog(@"%@", [[[NSString alloc] initWithData:[cachedResponse data] encoding:NSUTF8StringEncoding] autorelease]);
		return [cachedResponse autorelease];
	}
	return [super cachedResponseForRequest:request];
}

- (void) dealloc {

	[localcall release];
	[super dealloc];
}

@end
