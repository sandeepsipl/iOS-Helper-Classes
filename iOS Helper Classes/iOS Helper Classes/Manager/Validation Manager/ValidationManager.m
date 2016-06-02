//
//  ValidationManager.m
//  iOS Helper Classes
//
//  Created by Akshada on 5/31/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "ValidationManager.h"
#import "NSString+Helper.h"

@implementation ValidationManager

+ (ValidationManager *)getInstance {
    static dispatch_once_t once;
    static ValidationManager *sharedInstance;
    dispatch_once(&once, ^ { sharedInstance = [[self alloc] init]; });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        //Allocate all variables        
    }
    return self;
}

- (BOOL)blankFieldValidation:(NSString *)textfield {
    if (![[textfield trim] isEqualToString:@""]) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)checkPasswordStrength:(NSString *)textfield {
    if (![[textfield trim] isEqualToString:@""]) {
        if (!([textfield length] < 8)) {
            return TRUE;
        }
    }
    return FALSE;
}

- (BOOL)emailVerification:(NSString *)inputText {
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL verifyEmail = [emailTest evaluateWithObject:inputText];
    
    NSRange aRange;
    if(verifyEmail) {
        aRange = [inputText rangeOfString:@"." options:NSBackwardsSearch range:NSMakeRange(0, [inputText length])];
        int indexOfDot = aRange.location;
        ////NSLog(@"aRange.location:%d - %d",aRange.location, indexOfDot);
        if(aRange.location != NSNotFound) {
            NSString *topLevelDomain = [inputText substringFromIndex:indexOfDot];
            topLevelDomain = [topLevelDomain lowercaseString];
            ////NSLog(@"topleveldomains:%@",topLevelDomain);
            NSSet *TLD;
            TLD = [NSSet setWithObjects:@".aero", @".asia", @".biz", @".cat", @".com", @".coop", @".edu", @".gov", @".info", @".int", @".jobs", @".mil", @".mobi", @".museum", @".name", @".net", @".org", @".pro", @".tel", @".travel", @".ac", @".ad", @".ae", @".af", @".ag", @".ai", @".al", @".am", @".an", @".ao", @".aq", @".ar", @".as", @".at", @".au", @".aw", @".ax", @".az", @".ba", @".bb", @".bd", @".be", @".bf", @".bg", @".bh", @".bi", @".bj", @".bm", @".bn", @".bo", @".br", @".bs", @".bt", @".bv", @".bw", @".by", @".bz", @".ca", @".cc", @".cd", @".cf", @".cg", @".ch", @".ci", @".ck", @".cl", @".cm", @".cn", @".co", @".cr", @".cu", @".cv", @".cx", @".cy", @".cz", @".de", @".dj", @".dk", @".dm", @".do", @".dz", @".ec", @".ee", @".eg", @".er", @".es", @".et", @".eu", @".fi", @".fj", @".fk", @".fm", @".fo", @".fr", @".ga", @".gb", @".gd", @".ge", @".gf", @".gg", @".gh", @".gi", @".gl", @".gm", @".gn", @".gp", @".gq", @".gr", @".gs", @".gt", @".gu", @".gw", @".gy", @".hk", @".hm", @".hn", @".hr", @".ht", @".hu", @".id", @".ie", @" No", @".il", @".im", @".in", @".io", @".iq", @".ir", @".is", @".it", @".je", @".jm", @".jo", @".jp", @".ke", @".kg", @".kh", @".ki", @".km", @".kn", @".kp", @".kr", @".kw", @".ky", @".kz", @".la", @".lb", @".lc", @".li", @".lk", @".lr", @".ls", @".lt", @".lu", @".lv", @".ly", @".ma", @".mc", @".md", @".me", @".mg", @".mh", @".mk", @".ml", @".mm", @".mn", @".mo", @".mp", @".mq", @".mr", @".ms", @".mt", @".mu", @".mv", @".mw", @".mx", @".my", @".mz", @".na", @".nc", @".ne", @".nf", @".ng", @".ni", @".nl", @".no", @".np", @".nr", @".nu", @".nz", @".om", @".pa", @".pe", @".pf", @".pg", @".ph", @".pk", @".pl", @".pm", @".pn", @".pr", @".ps", @".pt", @".pw", @".py", @".qa", @".re", @".ro", @".rs", @".ru", @".rw", @".sa", @".sb", @".sc", @".sd", @".se", @".sg", @".sh", @".si", @".sj", @".sk", @".sl", @".sm", @".sn", @".so", @".sr", @".st", @".su", @".sv", @".sy", @".sz", @".tc", @".td", @".tf", @".tg", @".th", @".tj", @".tk", @".tl", @".tm", @".tn", @".to", @".tp", @".tr", @".tt", @".tv", @".tw", @".tz", @".ua", @".ug", @".uk", @".us", @".uy", @".uz", @".va", @".vc", @".ve", @".vg", @".vi", @".vn", @".vu", @".wf", @".ws", @".ye", @".yt", @".za", @".zm", @".zw", nil];
            if(topLevelDomain != nil && ([TLD containsObject:topLevelDomain])) {
                ////NSLog(@"TLD contains topLevelDomain:%@",topLevelDomain);
                return TRUE;
            }
            /*else {
             //NSLog(@"TLD DOEST NOT contains topLevelDomain:%@",topLevelDomain);
             }*/
            
        }
    }
    return FALSE;
    
}

- (BOOL)validatePhone:(NSString *)phoneNumber
{
    if ([[phoneNumber trim] length]==10) {
        NSString *phoneRegex = @"\\b([0-9%_.+\\-]+)\\b";
        NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
        
        return [phoneTest evaluateWithObject:phoneNumber];
    }
    else{
        return FALSE;
    }
    
}

- (BOOL)zipcodeVerification:(NSString *)zipCodeStr {
    NSString *zipRegex = @"(^[0-9]{5}(-[0-9]{4})?$)";
    NSPredicate *zipTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", zipRegex];
    
    return [zipTest evaluateWithObject:zipCodeStr];
}

- (NSDictionary*)getValidationMessageListFromPlist:(NSString *)plistName {
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    return dict;
}

@end
