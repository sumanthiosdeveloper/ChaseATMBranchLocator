//
//  NetworkManager.m
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/30/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import "NetworkManager.h"

#import "Location.h"

static NSString * const baseUrl = @"https://m.chase.com/PSRWeb/location/list.action?";

@implementation NetworkManager

- (void)getATMBranchLocationDetailsForCoordinates:(CLLocationCoordinate2D)coordinates
                                          success:(void (^)(NSArray *))successBlock
                                          failure:(void (^)(NSError *))failureBlock {
  
  
  NSString *urlString = [NSString stringWithFormat:@"%@lat=%f&lng=%f", baseUrl, coordinates.latitude, coordinates.longitude];
  
  NSURL *url = [NSURL URLWithString:urlString];
  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
  NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
  
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  request.HTTPMethod = @"GET";
  
  __weak __typeof__(self) weakSelf = self;
  
  NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                          completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                            
                                            __strong __typeof__(weakSelf) strongSelf = weakSelf;
                                            
                                            if (!error) {
                                              NSError *error;
                                              NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                                         options:NSJSONReadingAllowFragments error:&error];
                                              
                                              NSArray *locations = [strongSelf locationObjectsFromDictionary:dictionary];
                                              successBlock(locations);
                                            }
                                            else {
                                              failureBlock(error);
                                            }
  }];
  [task resume];
}

- (NSArray *)locationObjectsFromDictionary:(NSDictionary *)rawDictionary {

  NSArray *rawLocations = rawDictionary[@"locations"];
  
  NSMutableArray *locations = [NSMutableArray arrayWithCapacity:rawLocations.count];
  
  for (NSDictionary *rawLocation in rawLocations) {
    
    Location *location = [[Location alloc] initWithValuesDictionary:rawLocation];
    
    [locations addObject:location];
  }
  
  return locations;
}

@end
