//
//  Location.m
//  ChaseATMBranchLocator
//
//  Created by Sumanth on 7/30/15.
//  Copyright (c) 2015 Sumanth. All rights reserved.
//

#import "Location.h"

@implementation Location

- (instancetype)initWithValuesDictionary:(NSDictionary *)dictionary {
  
  self = [super init];
  if (!self) {
    return nil;
  }
  
  _locationType = [dictionary[@"locType"] uppercaseString];
  _name = dictionary[@"name"];
  _distance = [NSString stringWithFormat:@"%.2f", [dictionary[@"distance"] floatValue]] ;
  _address = [self locationAddressFromDictionary:dictionary];
  _phoneNumber = dictionary[@"phone"];
  _atmsCount = [dictionary[@"atms"] stringValue];
  _lobbyHoursInfo = [self lobbyHoursInfoFromDictionary:dictionary];
  
  return self;
}

- (NSString *)locationAddressFromDictionary:(NSDictionary *)dictionary {
  
  return [NSString stringWithFormat:@"%@\n%@,%@\n%@", dictionary[@"address"], dictionary[@"city"], dictionary[@"state"], dictionary[@"zip"]];
}

- (NSString *)lobbyHoursInfoFromDictionary:(NSDictionary *)dictionary {
  
  NSMutableString *string = [NSMutableString string];
  
  NSArray *lobbyHours = dictionary[@"lobbyHrs"];
  
  for (NSInteger index = 0; index < lobbyHours.count; index ++) {
    
    if (index == 0) {
      [string appendString:@"Sun Closed\n"];
    }
    else if (index == 1) {
      [string appendString:[NSString stringWithFormat:@"Mon %@\n", lobbyHours[index]]];
    }
    else if (index == 2) {
      [string appendString:[NSString stringWithFormat:@"Tue %@\n", lobbyHours[index]]];
    }
    else if (index == 3) {
      [string appendString:[NSString stringWithFormat:@"Wed %@\n", lobbyHours[index]]];
    }
    else if (index == 4) {
      [string appendString:[NSString stringWithFormat:@"Thr %@\n", lobbyHours[index]]];
    }
    else if (index == 5) {
      [string appendString:[NSString stringWithFormat:@"Fri %@\n", lobbyHours[index]]];
    }
    else if (index == 6) {
      [string appendString:[NSString stringWithFormat:@"Sat %@\n", lobbyHours[index]]];
    }
  }
  
  return [string copy];
}


@end
