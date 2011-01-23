//
//  MyWebView.m
//
//  Created by linluxiang on 10-11-4.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyWebView.h"


@implementation MyWebView

/*
@synthesize pagecontent;
@synthesize connection;
@synthesize url;
 */
@synthesize localcall;


- (id)initWithFrame:(CGRect)frame {
	NSLog(@"init2!");
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		localcall =	[LocalCall new];
    }
    return self;
}

#pragma mark UIWebView instance methods

/*
- (void)loadRequest:(NSURLRequest *)request {

	//NSLog(@"in loadRequet: %@\n", request.URL.absoluteString);
	url = request.URL;
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	//self.pagecontent = [NSMutableData dataWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil]];
	self.pagecontent = [NSMutableData dataWithContentsOfURL:url];
	//Here we can use NSMutableData dataWithContentOfUrl to get data while not call cache.
	
	//NSLog(@"%@\n",[[NSString alloc] initWithData:self.pagecontent encoding:NSUTF8StringEncoding]);
	//NSLog(@"in loadRequest: %@\n", [url absoluteString]);
	//self.pagecontent = [NSMutableData dataWithContentsOfURL:[request URL]];
	//[self.pagecontent appendData:[[NSString stringWithString:@"<?xml-stylesheet type=\"text/xsl\" href=\"wml.xslt\" ?>"] dataUsingEncoding:NSUTF8StringEncoding]];
	[self loadData:pagecontent MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:url];
	
}
 */


- (BOOL)webView:(UIWebView *)webView2 shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	if (!localcall) {
		localcall =	[LocalCall new];
	}
	NSURL *url = [request URL];
	NSLog(@"visit url = %@", [url absoluteString]);
	NSString *hoststring = [url host];
	NSString *pathstring = [url path];
	NSString *querystring = [[url query] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	if ([hoststring hasPrefix:@"localcall"]) {
		NSArray *query_array = [querystring componentsSeparatedByString: @"="];
		NSLog(@"path_string=%@", pathstring);
		NSLog(@"query_string=%@", querystring);
		NSData *response;
		if (query_array) {
			id object = [query_array lastObject];
			response = [localcall dataForFunc:pathstring withArgument:object];
			
		} else {
			response = [localcall dataForFunc:pathstring withArgument:nil];
		}
		NSString *response_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
		NSString *callback = [NSString stringWithFormat:@"handle_response(%@)", response_string];
		NSLog(@"response=%@", callback);
		[self stringByEvaluatingJavaScriptFromString:callback];
		//[self loadData:response MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:nil];
		[response_string release];
		return NO;
	}
	return YES;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView2 {
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


- (void)webView:(id)sender didClearWindowObject:(id)windowObject forFrame:(WebFrame*)frame {
	//First trial, nonsence
	[windowObject setValue:localcall forKey:@"localcall"];

}

- (void)dealloc {
	/*
	[connection release];
	[url release];
	[pagecontent release];
	 */
	[localcall release];
    [super dealloc];
}


@end
