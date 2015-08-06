//
//  Location.h
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/30/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (strong, nonatomic, readonly) NSString *state;

@property (strong, nonatomic, readonly) NSString *locationType;
@property (strong, nonatomic, readonly) NSString *label;
@property (strong, nonatomic, readonly) NSString *address;
@property (strong, nonatomic, readonly) NSString *city;
@property (strong, nonatomic, readonly) NSString *zip;
@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *bank;
@property (strong, nonatomic, readonly) NSString *type;

@property (strong, nonatomic, readonly) NSString *lobbyHoursInfo;
@property (strong, nonatomic, readonly) NSArray *driveUpHours;

@property (strong, nonatomic, readonly) NSString *atmsCount;
@property (strong, nonatomic, readonly) NSString *phoneNumber;
@property (strong, nonatomic, readonly) NSString *distance;


- (instancetype)initWithValuesDictionary:(NSDictionary *)dictionary;

@end
