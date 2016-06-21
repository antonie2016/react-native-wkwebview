//
//  ViewController.h
//  test1
//
//  Created by Mufasa on 21/6/2016.
//  Copyright © 2016 CKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageHandlerOpenURLScheme;
@class WKWebViewConfiguration;

@interface WKWebView : UIView

- (instancetype)initWithFrame:(CGRect)frame configuration: (WKWebViewConfiguration*) configuration;
- (void) evaluateJavaScript: (NSString*) js completionHandler: (id)callbackHandler;

@end

@interface ViewController : UIViewController

@property WKWebView* webview;

@end

@protocol WKScriptMessageHandler <NSObject>

//

@end

@interface WKUserContentController : NSObject

- (void)addScriptMessageHandler:(MessageHandlerOpenURLScheme*) messageHandlerOpenURLScheme name: (NSString*)name;

@end

@interface WKScriptMessage : NSObject

- (id) body;

@end

@interface WKWebViewConfiguration : NSObject

@property WKUserContentController* userContentController;

@end