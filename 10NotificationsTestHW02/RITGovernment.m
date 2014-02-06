//
//  RITGovernment.m
//  10NotificationsTest
//
//  Created by Aleksandr Pronin on 05.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITGovernment.h"

NSString* const RITGovernmentTaxLevelDidChangeNotification = @"RITGovernmentTaxLevelDidChangeNotification";
NSString* const RITGovernmentSalaryDidChangeNotification = @"RITGovernmentSalaryDidChangeNotification";
NSString* const RITGovernmentPensionDidChangeNotification = @"RITGovernmentPensionDidChangeNotification";
NSString* const RITGovernmentAveragePriceDidChangeNotification = @"RITGovernmentAveragePriceDidChangeNotification";

NSString* const RITGovernmentTaxLevelUserInfoKey = @"RITGovernmentTaxLevelUserInfoKey";
NSString* const RITGovernmentSalaryUserInfoKey = @"RITGovernmentSalaryUserInfoKey";
NSString* const RITGovernmentPensionUserInfoKey = @"RITGovernmentPensionUserInfoKey";
NSString* const RITGovernmentAveragePriceUserInfoKey = @"RITGovernmentAveragePriceUserInfoKey";

@implementation RITGovernment

- (id)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000;
        _pension = 500;
        _averagePrice = 14.f;
    }
    return self;
}

- (void) setTaxLevel:(CGFloat)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:RITGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RITGovernmentTaxLevelDidChangeNotification
                                                      object:nil
                                                      userInfo:dictionary];
    
}

- (void) setSalary:(CGFloat)salary {
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:RITGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RITGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setPension:(CGFloat)pension {
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:RITGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RITGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setAveragePrice:(CGFloat)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:RITGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RITGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

@end
