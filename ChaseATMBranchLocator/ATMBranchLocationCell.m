//
//  ATMBranchLocationCell.m
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/30/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import "ATMBranchLocationCell.h"
#import "Location.h"

@implementation ATMBranchLocationCell

- (void)configureCellWithLocation:(Location *)location {
  
  if (location) {
    self.locationLabel.text = location.locationType;
    self.distanceLabel.text = location.distance;
    self.nameLabel.text = location.name;
    self.addressLabel.text = location.address;
  }
}

@end
