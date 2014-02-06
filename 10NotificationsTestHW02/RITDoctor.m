//
//  RITDoctor.m
//  10NotificationsTest
//
//  Created by Aleksandr Pronin on 05.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITDoctor.h"
#import "RITGovernment.h"

@implementation RITDoctor

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:RITGovernmentSalaryDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:RITGovernmentAveragePriceDidChangeNotification
                 object:nil];
    }
    return self;
}

- (void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void) salaryChangedNotification: (NSNotification*) notification {
    
    CGFloat salary = [notification.userInfo[RITGovernmentSalaryUserInfoKey] floatValue];
    
    CGFloat variationPercent = (self.salary == 0) ? 0 : (salary/self.salary-1)*100;
    
    self.salary = salary;
    
    NSLog(@"%@: My salary changed on %6.2f", self.name, variationPercent);
    
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    CGFloat averagePrice = [notification.userInfo[RITGovernmentAveragePriceUserInfoKey] floatValue];
    
    CGFloat variationPercent = (self.averagePrice == 0) ? 0 : (averagePrice/self.averagePrice-1)*100;
    
    self.averagePrice = averagePrice;
    
    NSLog(@"%@: Average price changed on %6.2f", self.name, variationPercent);
    
}

@end
