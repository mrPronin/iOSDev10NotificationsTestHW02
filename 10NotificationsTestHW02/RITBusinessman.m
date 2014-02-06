//
//  RITBusinessman.m
//  10NotificationsTestHW01
//
//  Created by Pronin Alexander on 06.02.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITBusinessman.h"
#import "RITGovernment.h"

@implementation RITBusinessman

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:RITGovernmentTaxLevelDidChangeNotification
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

- (void) taxLevelChangedNotification: (NSNotification*) notification {
    
    CGFloat taxLevel = [notification.userInfo[RITGovernmentTaxLevelUserInfoKey] floatValue];
    
    CGFloat taxLevelVariationPercent = (self.taxLevel == 0) ? 0 : (taxLevel/self.taxLevel-1)*100;
    
    CGFloat incomeChangesPercent = self.inflation - taxLevelVariationPercent;
    
    NSLog(@"%@: tax level changed on %6.2f%%, income changed on %6.2f%%, my profit changed to %6.2f%%", self.name, taxLevelVariationPercent, self.inflation, incomeChangesPercent);
    
    self.taxLevel = taxLevel;
    
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    CGFloat averagePrice = [notification.userInfo[RITGovernmentAveragePriceUserInfoKey] floatValue];
    
    CGFloat variationPercent = (self.averagePrice == 0) ? 0 : (averagePrice/self.averagePrice-1)*100;
    
    self.averagePrice = averagePrice;
    
    self.inflation = variationPercent;
    
    //NSLog(@"%@: inflation was %6.2f %%", self.name, variationPercent);
    
}

@end
