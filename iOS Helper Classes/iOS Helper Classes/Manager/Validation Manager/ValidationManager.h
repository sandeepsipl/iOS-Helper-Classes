//
//  ValidationManager.h
//  iOS Helper Classes
//
//  Created by Akshada on 5/31/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidationManager : NSObject

+ (ValidationManager*)getInstance;


- (BOOL)blankFieldValidation:(NSString *)textfield;
- (BOOL)checkPasswordStrength:(NSString *)textfield;
- (BOOL)emailVerification:(NSString *)emailStr;
- (BOOL)validatePhone:(NSString *)phoneNumber;
- (BOOL)zipcodeVerification:(NSString *)zipCodeStr;
- (NSDictionary*)getValidationMessageListFromPlist:(NSString *)plistName;

@end
