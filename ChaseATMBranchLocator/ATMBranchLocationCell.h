//
//  ATMBranchLocationCell.h
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/30/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Location;

@interface ATMBranchLocationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

- (void)configureCellWithLocation:(Location *)location;

@end
