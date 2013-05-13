//
//  CityViewController.m
//  flurry_test
//
//  Created by Ivan Trufanov on 24.04.13.
//  Copyright (c) 2013 Werbary. All rights reserved.
//

#import "CityViewController.h"
#import "Flurry.h"

@implementation CityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height-40)/2, 320, 40)];
	titleLabel.textAlignment = NSTextAlignmentCenter;
	titleLabel.text = _cityName;
	[self.view addSubview:titleLabel];
	
	//Просто счетчик (На весь апп)
	[Flurry logPageView];
	
	//Конкретный View
	[Flurry logEvent:@"opened_city" withParameters:@{@"city": _cityName}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
