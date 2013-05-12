//
//  ViewController.m
//  flurry_test
//
//  Created by Ivan Trufanov on 24.04.13.
//  Copyright (c) 2013 Werbary. All rights reserved.
//

#import "ViewController.h"
#import "CityViewController.h"
#import "CountryViewController.h"
#import "Flurry.h"

@implementation CountryTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self setSelectionStyle:UITableViewCellSelectionStyleGray];
		
		[self.textLabel setTextAlignment:NSTextAlignmentRight];
		[self.textLabel setTextColor:[UIColor lightGrayColor]];
	}
	return self;
}

@end


@implementation CityTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self.textLabel setBackgroundColor:[UIColor clearColor]];
		[self.textLabel setTextColor:[UIColor whiteColor]];
		
		[self.contentView setBackgroundColor:[UIColor lightGrayColor]];
	}
	return self;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = @"Navigation";
	
	cities = @[@"Moscow", @"London",@"New york", @"Berlin",@"Afghanistan",];
	countries = @[@"Russia", @"Great Britain", @"USA", @"Germany"];
	
	//Просто счетчик (На весь апп)
	[Flurry logPageView];
	
	//Конкретный View
	[Flurry logEvent:@"opened_list"];
}

- (int) numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}
- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return [cities count];
	} else if (section == 1) {
		return [countries count];
	}
	return 0;
}
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return @"Cities";
	} else if (section == 1) {
		return @"Countries";
	}
	return @"Unknown";
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell;
	
	if (indexPath.section == 0) {
		cell = [tableView dequeueReusableCellWithIdentifier:@"city"];
		if (!cell) {
			cell = [[CityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"city"];
		}
		cell.textLabel.text = cities[indexPath.row];
	} else if (indexPath.section == 1) {
		cell = [tableView dequeueReusableCellWithIdentifier:@"country"];
		if (!cell) {
			cell = [[CountryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"country"];
		}
		
		cell.textLabel.text = countries[indexPath.row];
	}
	
	return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		CityViewController *cityView = [[CityViewController alloc] init];
		cityView.cityName = cities[indexPath.row];
		[self.navigationController pushViewController:cityView animated:YES];
	} else if (indexPath.section == 1) {
		CountryViewController *countryView = [[CountryViewController alloc] init];
		countryView.countryName = countries[indexPath.row];
		[self.navigationController pushViewController:countryView animated:YES];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
