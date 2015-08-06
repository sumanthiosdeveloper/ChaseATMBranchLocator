//
//  MapViewController.h
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/29/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>

@interface ATMBranchLocationsTableViewController : UIViewController <CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@end

