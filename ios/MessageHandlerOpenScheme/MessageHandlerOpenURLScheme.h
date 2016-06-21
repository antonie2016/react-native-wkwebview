//
//  MessageHandlerOpenURLScheme.h
//  test1
//
//  Created by Mufasa on 21/6/2016.
//  Copyright © 2016 CKC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
//WKScriptMessageHandler
//WKUserContentController
//WKScriptMessage

@interface MessageHandlerOpenURLScheme : NSObject<WKScriptMessageHandler>

@property (weak) ViewController *parent;

-(void) userContentController: (WKUserContentController *) userContentController didReceiveScriptMessage: (WKScriptMessage *) message;
- (NSDictionary *)getParsedJSON: (id) object;

@end
