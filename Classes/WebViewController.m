//
//  WebViewController.m
//  JSCallObjc
//
//  Created by linluxiang on 11-1-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

@synthesize webview_local, cache_local;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	webview_local.delegate = webview_local;
	NSString *path = [[NSBundle mainBundle] pathForResource:@"cache" ofType:@""];// the path to the cache file
	NSUInteger discCapacity = 10*1024*1024;
	NSUInteger memoryCapacity = 512*1024;
	cache_local =
	[[MyUrlCache alloc] initWithMemoryCapacity: memoryCapacity
								  diskCapacity: discCapacity diskPath:path];
	NSURLCache.sharedURLCache = cache_local;
	[webview_local loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]]]];
	//[self loadURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"] isDirectory:NO]];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[cache_local release];
	[webview_local release];
    [super dealloc];
}


@end
