//
//  CountryViewController.m
//  flurry_test
//
//  Created by Ivan Trufanov on 24.04.13.
//  Copyright (c) 2013 Werbary. All rights reserved.
//

#import "CountryViewController.h"
#import "Flurry.h"

@implementation CountryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height-40)/2, 320, 40)];
	titleLabel.textAlignment = NSTextAlignmentCenter;
	titleLabel.text = _countryName;
	[self.view addSubview:titleLabel];
	
	[Flurry logPageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
