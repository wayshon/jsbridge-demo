//
//  WebContainer.h
//  JsDemo
//
//  Created by wangxu-mp on 2020/3/26.
//  Copyright © 2020 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN

//定义一个JSExport protocol
@protocol JSExportProtocol <JSExport>

//用宏转换下，将JS函数名字指定为add；
JSExportAs(add, - (NSInteger)add:(NSInteger)n1 with:(NSInteger)n2);
JSExportAs(addByCallback, - (void)add:(NSInteger)n1 with:(NSInteger)n2 callback:(JSValue *)cb);
JSExportAs(openWKWebView, - (void)openWKWebView:(id)param);

@end

@interface WebContainer : UIViewController

@property (nonatomic, strong) NSString *path;

@end

NS_ASSUME_NONNULL_END
