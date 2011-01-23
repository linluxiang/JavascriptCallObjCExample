//
//  MyWebView.h
//
//  Created by linluxiang on 10-11-4.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocalCall.h"



@interface MyWebView : UIWebView <UIWebViewDelegate>{

	/*
	NSMutableData *pagecontent;
	NSURLConnection *connection;
	NSURL *url;
	BOOL done;
	*/
	LocalCall *localcall;
	
}
/*
@property (nonatomic, retain) NSMutableData *pagecontent;
@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, retain) NSURL *url;
 */
@property (nonatomic, retain) LocalCall *localcall;

- (void)webViewDidFinishLoad:(UIWebView *)webView;
- (void)webView:(id)sender didClearWindowObject:(id)windowObject forFrame:(WebFrame*)frame;

@end
