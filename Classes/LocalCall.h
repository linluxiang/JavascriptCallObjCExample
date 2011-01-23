//
//  Local.h
//  iWap
//
//  Created by linluxiang on 11-1-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSObjCRuntime.h>

@interface LocalCall : NSObject {
	/*
	NSString *test;
	NSString *func_name;
	NSString *result;
	NSString *send;
	 */
	//NSMutableDictionary *dispatcher;
}
/*
@property (nonatomic, retain) NSString *func_name;
@property (nonatomic, retain) NSString *result;
@property (nonatomic, retain) NSString *send;
*/
//@property (nonatomic, retain) NSMutableDictionary *dispatcher;

//+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector;

+ (BOOL)isKeyExcludedFromWebScript:(const char *)name;

- (NSData *)dataForFunc:(NSString *)path withArgument:(NSString *)argument;

- (NSString *)hello:(NSDictionary *)dct;
@end
