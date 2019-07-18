//
//  UIFont+Tool.m
//  NewBundle
//
// Build Settings -> Enable Strict Checking of objc_msgSend Calls -> No

#import "UIFont+Tool.h"
#import <objc/runtime.h>
@implementation UIFont (Tool)
/**
    拦截 类方法并替换
    应用场景 : 文字适配
 */
+(void)load{
    //获取系统方法地址
    Method sytemMethod = class_getClassMethod([UIFont class], @selector(systemFontOfSize:));
    //获取自定义方法地址
    Method customMethod = class_getClassMethod([UIFont class], @selector(newSystemFontOfSize:));
    //交换两个方法的实现
    method_exchangeImplementations(sytemMethod, customMethod);
}

// 创建替换的方法
+ (UIFont *)newSystemFontOfSize:(CGFloat)fontSize{
    //获取设备屏幕宽度，并计算出比例scale
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat scale  = width/375.0;
    //注意：由于方法交换，系统的方法名已变成了自定义的方法名，所以这里使用了
    //自定义的方法名来获取UIFont
    return [UIFont newSystemFontOfSize: scale *fontSize];
}
@end
