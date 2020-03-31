//
//  WebContainer.m
//  JsDemo
//
//  Created by wangxu-mp on 2020/3/26.
//  Copyright © 2020 wangxu. All rights reserved.
//

#import "WebContainer.h"
#import "WKWebContainer.h"

@interface WebContainer ()<JSExportProtocol>
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JSContext *context;
@end

@implementation WebContainer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    [self.view addSubview:self.webView];
    //创建context
    self.context = [_webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"]; // wkwebview 里没有这玩意
    //设置异常处理
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        [JSContext currentContext].exception = exception;
        NSLog(@"exception:%@",exception);
    };
    //将obj添加到context中
    self.context[@"OCObj"] = self;
    
    [self demoWithoutWebview];
}

- (void)demoWithoutWebview {
    JSContext *jsContext = [[JSContext alloc] init];
    JSValue *sum = [jsContext evaluateScript:@"function t() {return 666}; t();"];
    NSLog(@"%@", sum.toNumber);
}

#pragma mark - Getter
- (UIWebView *)webView{
    if(_webView == nil){
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        _webView.delegate = self;
        if ([[NSPredicate predicateWithFormat:@"SELF MATCHES %@",  @"http(s)?://.+"] evaluateWithObject:_path]) {
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_path]];
            [_webView loadRequest:request];
        } else {
            NSString *htmlString = [[NSString alloc]initWithContentsOfFile:_path encoding:NSUTF8StringEncoding error:nil];
            [_webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
        }
    }
    return _webView;
}

- (void)setupNavigationItem{
    UIBarButtonItem *ocCallItem = [[UIBarButtonItem alloc] initWithTitle:@"oc call js" style:UIBarButtonItemStyleDone target:self action:@selector(OCCallJs)];
    self.navigationItem.rightBarButtonItems = @[ocCallItem];
}

- (void)OCCallJs{
//    调用js的时候传参为一个数组，相当于 fn.apply(null, [xx])
    [_context[@"changeColor"] callWithArguments:@[@"green", @"yellow", ^(JSValue *value) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"oc call js callback" message:value.toString preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:([UIAlertAction actionWithTitle:@"哦" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }])];
        [self presentViewController:alertController animated:YES completion:nil];
    }]];
}

- (NSInteger)add:(NSInteger)a with:(NSInteger)b {
    return a + b;
}

// JSValue：表示的就是在 JSContext 中的 JS 变量 OC端的引用。毕竟是两门完全不同的语言。
- (void)add:(NSInteger)a with:(NSInteger)b callback:(JSValue *)cb {
    [cb callWithArguments:@[@(a + b)]];
}

- (void)openWKWebView:(id)param {
    //    在主线程更新 native UI
    dispatch_async(dispatch_get_main_queue(), ^{
        WKWebContainer *vc = [[WKWebContainer alloc] init];
//        vc.path = @"https://calcbit.com";
        vc.path = [[NSBundle mainBundle] pathForResource:@"index2.html" ofType:nil];
        [self.navigationController pushViewController:vc animated:YES];
    });
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
