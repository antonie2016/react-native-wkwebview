//
//  MessageHandlerOpenURLScheme.m
//  test1
//
//  Created by Mufasa on 21/6/2016.
//  Copyright © 2016 CKC. All rights reserved.
//

#import "MessageHandlerOpenURLScheme.h"

@implementation MessageHandlerOpenURLScheme

-(void) userContentController: (WKUserContentController *) userContentController didReceiveScriptMessage: (WKScriptMessage *) message {
    NSDictionary* const parsed = [self getParsedJSON: [message body]];
    NSString* const callback = [parsed objectForKey:@"callback"];
    NSString* const urlscheme = [parsed objectForKey:@"urlscheme"];
    
    BOOL const success = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlscheme]];
    NSString* const js = [NSString stringWithFormat: @"%@(%s,\"%@\");", callback, success ? "true" : "false", urlscheme];
    [self.parent.webview evaluateJavaScript:js completionHandler: nil];
}

- (NSDictionary *)getParsedJSON: (id) object {
    
    @try {
        NSString* const jsonString = (NSString*)object;
        NSData* const jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* const parsed = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
        return parsed;
    } @catch (NSException *exception) {
        NSLog(@"A JSON parsing error occured:\n %@", exception);
    }
    return nil;
}


@end
