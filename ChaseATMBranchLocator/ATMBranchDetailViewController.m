//
//  ATMBranchDetailViewController.m
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/30/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import "ATMBranchDetailViewController.h"

@implementation ATMBranchDetailViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  self.title = self.selectedLocation.name;
  
  self.addressLabel.text = self.selectedLocation.address;
  self.atmlabel.text = self.selectedLocation.atmsCount;
  
  self.distanceLabel.text = self.selectedLocation.distance;
  self.lobbyLabel.text = self.selectedLocation.lobbyHoursInfo;

  self.phoneLabel.text = self.selectedLocation.phoneNumber;
}

@end
