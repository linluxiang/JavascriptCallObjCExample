//
//  Local.m
//
//  Created by linluxiang on 11-1-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LocalCall.h"


@implementation LocalCall

/*
static NSString *test;
static NSString *func_name;
static NSString *result;
static NSString *send;
*/
//@synthesize func_name, result, send;

-(id)init {
	if ((self = [super init])) {
        // Initialization code
    }
	return self;
}

- (NSData *)dataForFunc:(NSString *)path withArgument:(NSString *)argument {
	if ([path hasPrefix:@"/hello"]) {
		NSDictionary *dct = [argument JSONValue];
		NSLog(@"dct=%@", dct);
		NSString *func_result =[self hello:dct];
		dct = [NSDictionary dictionaryWithObject:func_result forKey:@"result"];
		NSString *r = [NSString stringWithFormat:@"%@", [dct JSONRepresentation]];
		return [r dataUsingEncoding:NSUTF8StringEncoding];
	} else {
		return nil;
	}

}

- (NSString *)hello:(NSDictionary *)dct {
	NSString *name = [dct objectForKey:@"name"];
	NSLog(@"name=%@", name);
	return [NSString stringWithFormat:@"hello %@!", name];
}

/*
+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector {
	NSLog(@"in is isSelectorExcluded: %@", aSelector);
	if (aSelector == @selector(funcWithoutArgument)) {
		return NO;
	} else if (aSelector == @selector(getString:)) {
		return NO;
	}
    return YES;
};
*/
/*
+ (NSString *)webScriptNameForSelector:(SEL)aSelector
{
	//NSLog(@"in is webScriptNameForSelector: %@", aSelector);
	NSString *name;
    if (aSelector == @selector(func_without_argument)) {
		name = [NSString stringWithString:@"func_without_argument" ];
	} else if (aSelector == @selector(get_string:)) {
		name = [NSString stringWithString:@"get_string"];
	}
    return name;
}
*/
/*
+ (BOOL)isKeyExcludedFromWebScript:(const char *)name {
	if (!strcmp(name, "func_name")) {
		return NO;
	} else if (!strcmp(name, "send")) {
		if ([self respondsToSelector:@selector(doSelector)]) {
			NSLog(@"%@", @"in send");
			[self doSelector];
		}
		return YES;
	}
	return YES;
};
*/
- (void)dealloc {
	/*
	[func_name release];
	[result release];
	[send release];
	 */
	//[dispatcher release];
	[super dealloc];
}

@end
