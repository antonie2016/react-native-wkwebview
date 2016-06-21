//
//  ViewController.m
//  test1
//
//  Created by Mufasa on 21/6/2016.
//  Copyright © 2016 CKC. All rights reserved.
//

#import "ViewController.h"
#import "MessageHandlerOpenURLScheme.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    WKUserContentController* userContentController = [[WKUserContentController alloc] init];
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = userContentController;
    
    MessageHandlerOpenURLScheme* const messageHandlerOpenURLScheme = [[MessageHandlerOpenURLScheme alloc] init];
    messageHandlerOpenURLScheme.parent = self;
    [userContentController addScriptMessageHandler:messageHandlerOpenURLScheme name: @"trustlyOpenURLScheme"];
    
    self.webview = [[WKWebView alloc] initWithFrame:self.view.bounds configuration: configuration];
    self.view = self.webview;

}


@end
