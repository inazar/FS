//
//  FSURLCache.m
//  forStarters
//
//  Created by Назар on 22.05.13.
//
//

#import "FSURLCache.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation FSURLCache

- (NSString*) fileMIMEType:(NSString*) file {
    
    NSDictionary *mimeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"image/png",
                              @"png",
                              @"iimage/jpeg",
                              @"jpg",
                              @"image/gif",
                              @"gif",
                              @"application/x-javascript",
                              @"js",
                              @"text/css",
                              @"css",
                nil];
    
    return [mimeDict objectForKey:[file pathExtension]];
}

-(NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request
{
    NSURL *requestUrl = [request URL];
    // Get the path for the request
    NSString *pathString = [requestUrl relativePath];
    
    if (!([[requestUrl host] isEqualToString: @"bundle"])) return [super cachedResponseForRequest:request];

    // Get the path to the substitution file
    NSString *filePath = [NSString stringWithFormat:@"%@/%@/%@", [[NSBundle mainBundle] resourcePath], @"www", pathString];
    NSAssert(filePath, @"File %@ didn't exist", filePath);
    
    // Load the data
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSLog(@"file: %@, mime: %@", pathString, [self fileMIMEType: pathString]);
    
    // Create the cacheable response
    NSURLResponse *response = [[[NSURLResponse alloc] initWithURL:[request URL] MIMEType:[self fileMIMEType: pathString] expectedContentLength:[data length] textEncodingName:nil] autorelease];
    NSCachedURLResponse *cachedResponse = [[[NSCachedURLResponse alloc] initWithResponse:response data:data] autorelease];
    
    return cachedResponse;
}

@end
