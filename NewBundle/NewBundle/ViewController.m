//
//  ViewController.m
//  NewBundle
//


#import "ViewController.h"
#import "UIFont+Tool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 实例方法 替换*/
    NSString *bundleid = [[NSBundle mainBundle] bundleIdentifier];
    bundleid = [NSString stringWithFormat:@"实例方法:%@",bundleid];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:bundleid forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 20);
    
    
    /** 类方法  替换*/
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"类方法:%f",label.font.pointSize];
    [self.view addSubview:label];
    label.frame = CGRectMake(20, 300, self.view.frame.size.width - 40, 20);
    
}


@end
