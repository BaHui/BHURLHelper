//
//  BHExampleViewController.m
//  BHDemo
//
//  Created by QiaoBaHui on 2018/9/18.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "BHExampleViewController.h"
#import "NSString+BHURLHelper.h"

@interface BHExampleViewController ()

@end

static NSString *const DEMO_VIEWS_STORYBOARD_NAME = @"DemoViews";


@implementation BHExampleViewController

+ (instancetype)create {
	UIStoryboard *demoViewsStoryboard = [UIStoryboard storyboardWithName:DEMO_VIEWS_STORYBOARD_NAME bundle:nil];
	return [demoViewsStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([BHExampleViewController class])];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
	[super viewDidLoad];

	[self addParameterTest];
	[self deleteParameterTest];
	[self modifyParameterTest];
	[self parseAllParametersTest];
}

#pragma mark - Private Methods

- (void)addParameterTest {
	NSString *urlString = @"https://github.com";

	NSString *addResult = [urlString addParameters:@{@"name" : @"qiaobahui"}];
	NSLog(@"addResult: %@", addResult); // 输出结果: https://github.com?name=qiaobahui
}

- (void)deleteParameterTest {
	NSString *urlString = @"https://github.com?name=qiaobahui&age=23";

	NSString *deleteResult = [urlString deleteParameterOfKey:@"age"];
	NSLog(@"deleteResult: %@", deleteResult); // 输出结果: https://github.com?name=qiaobahui
}

- (void)modifyParameterTest {
	NSString *urlString = @"https://github.com?name=qiaobahui&age=23";

	NSString *modifyResult = [urlString modifyParameterOfKey:@"age" toValue:@"100"];
	NSLog(@"modifyResult: %@", modifyResult); // 输出结果: https://github.com?name=qiaobahui&age=100
}

- (void)parseAllParametersTest {
	NSString *urlString = @"https://github.com?name=qiaobahui&age=23";

	NSDictionary *parametersResult = [urlString parseURLParameters];
	NSLog(@"parameterResult: %@", parametersResult); // 输出结果: parameterResult: {age = 23; name = qiaobahui;}
}

@end
