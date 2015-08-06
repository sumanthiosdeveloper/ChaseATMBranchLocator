//
//  NetworkManager.h
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/30/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface NetworkManager : NSObject

- (void)getATMBranchLocationDetailsForCoordinates:(CLLocationCoordinate2D)coordinates
                                          success:(void (^)(NSArray *locations))successBlock
                                          failure:(void (^)(NSError *error))failureBlock;
@end
