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
    
    CGFloat pensionVariationPercent = (self.pension == 0) ? 0 : (pension/self.pension-1)*100;
    
    CGFloat incomeChangesPercent = pensionVariationPercent - self.inflation;
    
    NSLog(@"%@: my pension changed on %6.2f%%, inflation was %6.2f%%, my income changed on %6.2f%%", self.name, pensionVariationPercent, self.inflation, incomeChangesPercent);
    
    self.pension = pension;

}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    CGFloat averagePrice = [notification.userInfo[RITGovernmentAveragePriceUserInfoKey] floatValue];
    
    CGFloat variationPercent = (self.averagePrice == 0) ? 0 : (averagePrice/self.averagePrice-1)*100;
    
    self.averagePrice = averagePrice;
    
    self.inflation = variationPercent;
    
    //NSLog(@"%@: inflation was %6.2f %%", self.name, variationPercent);
    
}

@end
