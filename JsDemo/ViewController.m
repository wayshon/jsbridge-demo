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

- (IBAction)goUIWebView:(id)sender {
    WKWebContainer *vc = [[WKWebContainer alloc] init];
//    WebContainer *vc = [[WebContainer alloc] init];
    vc.path = [[NSBundle mainBundle] pathForResource:@"index2.html" ofType:nil];
//    vc.path = @"https://calcbit.com";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
