//
//  ATMBranchDetailViewController.h
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/30/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface ATMBranchDetailViewController : UIViewController

@property (strong, nonatomic) Location *selectedLocation;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *atmlabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *lobbyLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@end
