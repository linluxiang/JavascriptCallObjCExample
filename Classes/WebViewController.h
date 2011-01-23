//
//  WebViewController.h
//  JSCallObjc
//
//  Created by linluxiang on 11-1-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyWebView.h"
#import "MyUrlCache.h"

@interface WebViewController : UIViewController {
	IBOutlet MyWebView *webview_local;
	MyUrlCache *cache_local;
}

@property (nonatomic, retain) MyWebView *webview_local;
@property (nonatomic, retain) MyUrlCache *cache_local;

@end
