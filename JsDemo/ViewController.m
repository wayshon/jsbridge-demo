//
//  ViewController.m
//  JsDemo
//
//  Created by wangxu-mp on 2020/3/26.
//  Copyright © 2020 wangxu. All rights reserved.
//

#import "ViewController.h"
#import "WebContainer.h"
#import "WKWebContainer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)goWkWbview:(id)sender {
    WKWebContainer *vc = [[WKWebContainer alloc] init];
    NSString *str = [[NSBundle mainBundle] pathForResource:@"fe-file/wkweb/index.html" ofType:nil];
    NSLog(@"%@", str);
    vc.path = str;
//    vc.path = @"https://calcbit.com";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goUIWebView:(id)sender {
    WebContainer *vc = [[WebContainer alloc] init];
    NSString *str = [[NSBundle mainBundle] pathForResource:@"fe-file/webview/index.html" ofType:nil];
    NSLog(@"%@", str);
    vc.path = str;
//    vc.path = @"https://calcbit.com";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
