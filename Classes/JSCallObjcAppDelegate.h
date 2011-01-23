//
//  JSCallObjcAppDelegate.h
//  JSCallObjc
//
//  Created by linluxiang on 11-1-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface JSCallObjcAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet UIWindow *window;
	IBOutlet WebViewController *controller;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebViewController *controller;

@end

