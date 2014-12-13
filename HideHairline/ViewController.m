//
//  ViewController.m
//  HideHairline
//
//  Created by 孙博弘 on 14/12/13.
//  Copyright (c) 2014年 Sun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.title = @"隐藏NavigationBar底部线条";
	[self.navigationController.navigationBar setTranslucent:YES];
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"TransparentPixel"] forBarMetrics:UIBarMetricsDefault];

	//第1种方法
	[self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"TransparentPixel"]];

	//第2种方法
	UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
	navBarHairlineImageView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
	if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
		return (UIImageView *)view;
	}
	for (UIView *subview in view.subviews) {
		UIImageView *imageView = [self findHairlineImageViewUnder:subview];
		if (imageView) {
			return imageView;
		}
	}
	return nil;
}

@end
