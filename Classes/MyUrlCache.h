//
//  MyUrlCache.h
//
//  Created by linluxiang on 10-11-9.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LocalCall.h"

@interface MyUrlCache : NSURLCache {
	LocalCall *localcall;
}

@property (nonatomic, retain) LocalCall *localcall;

@end
