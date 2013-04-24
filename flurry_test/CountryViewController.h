//
//  CountryViewController.h
//  flurry_test
//
//  Created by Ivan Trufanov on 24.04.13.
//  Copyright (c) 2013 Werbary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryViewController : UIViewController {
	UILabel *titleLabel;
}
@property (nonatomic, strong) NSString *countryName;
@end
