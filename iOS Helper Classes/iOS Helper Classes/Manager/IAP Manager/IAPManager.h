//
//  IAPManager.h
//  iOS Helper Classes
//
//  Created by Akshada on 5/31/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#define kInAppPurchaseManagerTransactionFailedNotification @"kInAppPurchaseManagerTransactionFailedNotification"
#define kInAppPurchaseManagerTransactionSucceededNotification @"kInAppPurchaseManagerTransactionSucceededNotification"

@interface IAPManager : NSObject<SKProductsRequestDelegate,SKPaymentTransactionObserver> {
    SKProduct *proUpgradeProduct;
    SKProductsRequest *productsRequest;
    NSString* productID;
    NSString* PayUserID;
    id ViewControllerObj;
}

+ (IAPManager*)getInstance;

- (void)loadStore:(id)vc forProduct:(NSString*)productName;
- (BOOL)canMakePurchases;
- (void)purchaseProduct;
- (void)restorePreviousPurchase;

//- (void)loadStor1e:(NSString*)productName success:(void (^)( NSDictionary*dic_))success failure:(void (^)(NSDictionary *responsefailure))failure;
//- (void)loadStore:(NSString*)productName success:(void (^)(SKPaymentTransaction *transaction))success failure:(void (^)(SKPaymentTransaction *transaction))failure;

@end