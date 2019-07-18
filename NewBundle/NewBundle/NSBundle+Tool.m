//
//  NSBundle+Tool.m
//  LLWKWebView
//
// Build Settings -> Enable Strict Checking of objc_msgSend Calls -> No

#import "NSBundle+Tool.h"
#import <objc/runtime.h>
@implementation NSBundle (Tool)
/**
    拦截 实例方法并替换
    应用场景: 某些功能是根据AppStoreID 才可以进行初始化时
 */
+(void)load{
    NSString *bundleid = [[self mainBundle] bundleIdentifier];
    
    NSLog(@"\n-拦截到-bundleid:-------%@",bundleid);
    if ([bundleid isEqualToString:@"cn.test.1"] ||
        [bundleid isEqualToString:@"cn.com.test"]) {
        
        //获取系统方法地址
        Method sytemMethod = class_getInstanceMethod([NSBundle class], @selector(bundleIdentifier));
        //获取自定义方法地址
        Method customMethod = class_getInstanceMethod([NSBundle class], @selector(newBundleIdentifier));
        //交换两个方法的实现
        method_exchangeImplementations(sytemMethod, customMethod);
    }
}

/** 返回需要的BundleID*/
-(NSString *)newBundleIdentifier{
    return @"cn.com.AppStoreID";
}
@end
