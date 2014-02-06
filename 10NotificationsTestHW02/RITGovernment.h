//
//  RITGovernment.h
//  10NotificationsTest
//
//  Created by Aleksandr Pronin on 05.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const RITGovernmentTaxLevelDidChangeNotification;
extern NSString* const RITGovernmentSalaryDidChangeNotification;
extern NSString* const RITGovernmentPensionDidChangeNotification;
extern NSString* const RITGovernmentAveragePriceDidChangeNotification;

extern NSString* const RITGovernmentTaxLevelUserInfoKey;
extern NSString* const RITGovernmentSalaryUserInfoKey;
extern NSString* const RITGovernmentPensionUserInfoKey;
extern NSString* const RITGovernmentAveragePriceUserInfoKey;

@interface RITGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;

@end
