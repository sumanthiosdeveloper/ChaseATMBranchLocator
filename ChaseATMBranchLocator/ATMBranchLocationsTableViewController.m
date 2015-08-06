//
//  ViewController.m
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/29/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import "ATMBranchLocationsTableViewController.h"

#import <MBProgressHUD/MBProgressHUD.h>

#import "ATMBranchLocationCell.h"
#import "ATMBranchDetailViewController.h"
#import "NetworkManager.h"

static NSString *const cellIdentifier = @"ATMBranchCell";

@interface ATMBranchLocationsTableViewController ()
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NetworkManager *networkManager;
@property (nonatomic, strong) NSArray *locations;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ATMBranchLocationsTableViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  [self setupNetworkManager];
  
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
  self.locationManager.delegate = self;
  
  [self checkForLocationPermissions];
}

- (void)setupNetworkManager {
  
  _networkManager = [[NetworkManager alloc] init];
}

- (void)checkForLocationPermissions {
  
  CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
  
  if (authorizationStatus != (kCLAuthorizationStatusAuthorizedAlways | kCLAuthorizationStatusAuthorizedWhenInUse)) {
    
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startMonitoringSignificantLocationChanges];
  }
}

- (void)requestATMBranchLocationDetailsForCoordinates:(CLLocationCoordinate2D)coordinates {
 
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  
  __weak __typeof__(self) weakSelf = self;
  [self.networkManager getATMBranchLocationDetailsForCoordinates:coordinates
                                                         success:^(NSArray *locations) {
                                                           
                                                          __strong __typeof__(weakSelf) strongSelf = weakSelf;
                                                           
                                                           strongSelf.locations = locations;
                                                           
                                                           dispatch_async(dispatch_get_main_queue(), ^{
                                                             [self.tableView reloadData];
                                                             [MBProgressHUD hideAllHUDsForView:strongSelf.view animated:YES];
                                                           });
                                                           
                                                         } failure:^(NSError *error){
                                                           
                                                           
                                                         }];
}

#pragma mark - CLLocationManagerDelegate 

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  
  CLLocation *location = [locations lastObject];
  [self requestATMBranchLocationDetailsForCoordinates:location.coordinate];
  [self.locationManager stopMonitoringSignificantLocationChanges];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  return self.locations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  ATMBranchLocationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  [cell configureCellWithLocation:self.locations[indexPath.row]];
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [self performSegueWithIdentifier:@"locationDetailsSegue" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  NSIndexPath *indexPath = (NSIndexPath *)sender;
  
  if ([segue.identifier isEqualToString:@"locationDetailsSegue"]) {
    
    Location *selectedLocation = self.locations[indexPath.row];
    
    ATMBranchDetailViewController *detailVC = (ATMBranchDetailViewController *)segue.destinationViewController;
    detailVC.selectedLocation = selectedLocation;
  }
}

@end


