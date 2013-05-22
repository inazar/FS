//
//  FSURLCache.h
//  forStarters
//
//  Created by Назар on 22.05.13.
//
//

#import <Foundation/Foundation.h>

@interface FSURLCache : NSURLCache

- (NSString*) fileMIMEType:(NSString*) file;

@end
