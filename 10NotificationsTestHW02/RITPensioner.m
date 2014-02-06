//
//  RITPensioner.m
//  10NotificationsTestHW01
//
//  Created by Pronin Alexander on 06.02.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITPensioner.h"
#import "RITGovernment.h"

@implementation RITPensioner

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(pensionChangedNotification:)
                   name:RITGovernmentPensionDidChangeNotification
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

- (void) pensionChangedNotification: (NSNotification*) notification {
    
    CGFloat pension = [notification.userInfo[RITGovernmentPensionUserInfoKey] floatValue];
    
    CGFloat variationPercent = (self.pension == 0) ? 0 : (pension/self.pension-1)*100;
    
    self.pension = pension;
    
    NSLog(@"%@: My pension changed on %6.2f", self.name, variationPercent);

}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    CGFloat averagePrice = [notification.userInfo[RITGovernmentAveragePriceUserInfoKey] floatValue];
    
    CGFloat variationPercent = (self.averagePrice == 0) ? 0 : (averagePrice/self.averagePrice-1)*100;
    
    self.averagePrice = averagePrice;
    
    NSLog(@"%@: Average price changed on %6.2f", self.name, variationPercent);
    
}

@end
