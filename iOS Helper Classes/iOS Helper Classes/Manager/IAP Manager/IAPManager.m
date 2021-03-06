//
//  IAPManager.m
//  iOS Helper Classes
//
//  Created by Akshada on 5/31/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "IAPManager.h"

@implementation IAPManager

+ (IAPManager*)getInstance {
    static dispatch_once_t once;
    static IAPManager *sharedInstance;
    dispatch_once(&once, ^{ sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        //Allocate all variables
    }
    return self;
}

- (void)requestProUpgradeProductData:(NSString*)productName {
    
    productID = productName;
    
    /*
    switch ([[ApplicationManager getInstance] productId]) {
        case 1:
            productID = BAND_SUBSCRIPTION;
            break;
        default:
            break;
    }
    */
    
    NSSet *productIdentifiers = [NSSet setWithObject:productID];
    productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
}

- (void)loadStore:(id)vc forProduct:(NSString*)productName{
    
    if([self rootCheck]){
        return;
    }
    
    ViewControllerObj = vc;
    
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [self requestProUpgradeProductData:productName];
}

- (BOOL)canMakePurchases {
    return [SKPaymentQueue canMakePayments];
}

- (void)purchaseProduct {
    if(proUpgradeProduct) {
        SKPayment *payment = [SKPayment paymentWithProduct:proUpgradeProduct];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    } else {
        NSLog(@"Oops! No product found or product is invalid.");
                
//        [[ApplicationManager getInstance] showAlertForVC:nil withTitle:@"Oops!" andMessage:@"No product found or product is invalid."];
        [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionFailedNotification object:self userInfo:nil];
        
        return;
    }
}

- (void)recordTransaction:(SKPaymentTransaction *)transaction
{
    if ([transaction.payment.productIdentifier isEqualToString:productID])
    {
        // save the transaction receipt to disk
        NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
        NSData *receipt = [NSData dataWithContentsOfURL:receiptURL];
        if (!receipt) {
            /* No local receipt -- handle the error. */
        } else {
            //            [[NSUserDefaults standardUserDefaults] setValue:receipt forKey:@"proUpgradeTransactionReceipt" ];
            //            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}

- (void)finishTransaction:(SKPaymentTransaction *)transaction wasSuccessful:(BOOL)wasSuccessful {
    // remove the transaction from the payment queue.
//    STOP_ACTIVITY_INDICATOR;
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:transaction, @"transaction" ,transaction.payment.productIdentifier,@"productId", nil];
    if (wasSuccessful) {
        //transaction receipt
        if([self transcationReceipt:transaction]){
            [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionSucceededNotification object:self userInfo:userInfo];
        }else{
            //comment
        }
        
    } else {
        if(transaction.error.code == SKErrorPaymentCancelled){
            NSLog(@"transaction error code %ld",(long)transaction.error.code);
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionFailedNotification object:self userInfo:userInfo];
        }
    }
    
}

- (void)completeTransaction:(SKPaymentTransaction *)transaction {
    
    [self recordTransaction:transaction];
    [self finishTransaction:transaction wasSuccessful:YES];
//    STOP_ACTIVITY_INDICATOR;
}

- (void)restoreTransaction:(SKPaymentTransaction *)transaction {
    [self recordTransaction:transaction.originalTransaction];
    [self finishTransaction:transaction wasSuccessful:YES];
//    STOP_ACTIVITY_INDICATOR;
}

- (void)failedTransaction:(SKPaymentTransaction *)transaction {
    if (transaction.error.code != SKErrorPaymentCancelled) {
        [self finishTransaction:transaction wasSuccessful:NO];
    } else {
        [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    }
//    STOP_ACTIVITY_INDICATOR;
}

- (void)restoreCompletedTransactions {
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}
- (void)restorePreviousPurchase {
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

#pragma mark - SKProductsRequestDelegate methods

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSArray *products = response.products;
    proUpgradeProduct = [products count] == 1 ? [products objectAtIndex:0]  : nil;
    if (proUpgradeProduct) {
        NSLog(@"Product title: %@" , proUpgradeProduct.localizedTitle);
        NSLog(@"Product description: %@" , proUpgradeProduct.localizedDescription);
        NSLog(@"Product price: %@" , proUpgradeProduct.price);
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:proUpgradeProduct.price forKey:@"PRODUCT_PRICE"];
        NSLog(@"Product id: %@" , proUpgradeProduct.productIdentifier);
    }
    
    for (NSString *invalidProductId in response.invalidProductIdentifiers) {
        NSLog(@"Invalid product id: %@" , invalidProductId);
    }
    
    if([self canMakePurchases])
        [self purchaseProduct];
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    
    NSLog(@"Error! Unable to connect with iTunes Store. Please try later. %@",error);
    
//    [[ApplicationManager getInstance] showAlertForVC:nil withTitle:@"Error!" andMessage:@"Unable to connect with iTunes Store. Please try later."];
}

#pragma mark - SKPaymentTransactionObserver methods

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        NSLog(@"tras %ld",(long)transaction.transactionState);
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
                break;
            default:
                break;
        }
    }
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error {
    NSLog(@"ERROR: %@", [error.userInfo objectForKey:@"NSLocalizedDescription"]);
    //[[ApplicationManager getInstance] showAlertForVC:nil withTitle:@"Oops!" andMessage:[error.userInfo objectForKey:@"NSLocalizedDescription"]];
//    UIAlertView *alert=[[UIAlertView alloc]
//                        initWithTitle:@"Sorry"
//                        message:@"Connection to iTunes Failed"
//                        delegate:nil
//                        cancelButtonTitle:@"Dismiss"
//                        otherButtonTitles:nil, nil];
//    [alert show];
    
    
}

- (void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    NSMutableArray *purchasedItemIDs = [[NSMutableArray alloc] init];
    NSLog(@"received restored transactions: %lu", (unsigned long)queue.transactions.count);
    for (SKPaymentTransaction *transaction in queue.transactions)
    {
        NSString *identityproductID = transaction.payment.productIdentifier;
        [purchasedItemIDs addObject:identityproductID];
        NSLog(@"%@",purchasedItemIDs);
    }
}


#pragma mark Validating Receipts With the App Store

-(BOOL)transcationReceipt:(SKPaymentTransaction *)transaction{
//    STOP_ACTIVITY_INDICATOR;
    NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *reciptData = [NSData dataWithContentsOfURL:receiptURL];
    if (!reciptData) {
        /* No local receipt -- handle the error. */
        NSLog(@"NO transaction Receipt");
        return 0;
    } else {
        NSError *error;
        NSDictionary *requestContents = @{
                                          @"receipt-data": [reciptData base64EncodedStringWithOptions:0]
                                          };
        NSData *requestData = [NSJSONSerialization dataWithJSONObject:requestContents
                                                              options:0
                                                                error:&error];
        
        if (!requestData) { /* ... Handle error ... */ }
        
        // Create a POST request with the receipt data.
        
        // check for an error. If there is a network error, you should handle it here.
        
        
        if(!error)
        {
            //log response
            //DLog(@"Response from server = %@", responseString);
            return 1;
        }
        return 0;
    }
}

#pragma mark rootCheck

- (BOOL)rootCheck {
#if TARGET_IPHONE_SIMULATOR
    return NO;
#endif
    /* Check if device is Jailbroken */
    NSArray *jailbrokenPath = [NSArray arrayWithObjects:
                               @"/Applications/Cydia.app",
                               @"/Applications/RockApp.app",
                               @"/Applications/Icy.app",
                               @"/usr/sbin/sshd",
                               @"/usr/bin/sshd",
                               @"/usr/libexec/sftp-server",
                               @"/Applications/WinterBoard.app",
                               @"/Applications/SBSettings.app",
                               @"/Applications/MxTube.app",
                               @"/Applications/IntelliScreen.app",
                               @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
                               @"/Applications/FakeCarrier.app",
                               @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
                               @"/private/var/lib/apt",
                               @"/Applications/blackra1n.app",
                               @"/private/var/stash",
                               @"/private/var/mobile/Library/SBSettings/Themes",
                               @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
                               @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
                               @"/private/var/tmp/cydia.log",
                               @"/private/var/lib/cydia", nil];
    
    BOOL rooted = NO;
    for(NSString *string in jailbrokenPath)
        if ([[NSFileManager defaultManager] fileExistsAtPath:string]) {
            rooted=YES;
            break;
        }
    return rooted;
}

@end
