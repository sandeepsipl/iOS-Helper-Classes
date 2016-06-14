# iOS-Helper-Classes
iOSHelperClasses is a library that includes some helper and manager classes which provides some convenience methods.

List of classes included:

1. NSData Helper

+ (NSData *)dataFromBase64String:(NSString *)aString;

Method Name: dataFromBase64String:aString
Parameters: aString = Base64String
Returns: Data from given string in NSData.

- (NSString *)base64EncodedString;

Method Name: base64EncodedString
Parameters: nil
Returns: String encoded in base64.

2. NSString Helper.

- (NSString*)getMD5String;

Method Name: getMD5String
Parameters: nil
Returns: MD5String as NSString.

- (NSUInteger)getWordCount;

Method Name: getWordCount
Parameters: nil
Returns: Word count of string in NSUInteger.

- (NSString*)stringByUrlEncoding;

Method Name: stringByUrlEncoding
Parameters: nil
Returns: String.

- (NSString*)base64Encoding;

Method Name: base64Encoding
Parameters: nil
Returns: Encoded string in base64Encoding.

- (NSString*)trim;

Method Name: trim
Parameters: nil
Returns: String in without white space and new line character.

- (BOOL)startsWith:(NSString*)s;

Method Name: startsWith:s
Parameters: s = A String in NSString format.
Returns: True if string starts with string 's' else false.

- (BOOL)containsString:(NSString*)aString;

Method Name: containsString:aString
Parameters: aString = A String in NSString format.
Returns: True if string contains with string 'aString' else false.

- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b;

Method Name: substringFrom:(NSInteger)a to:(NSInteger)b
Parameters: a = A number from where to start in NSInteger format.
b = A number from where to end in NSInteger format.
Returns: A string containing the characters within the range from a to b.

- (BOOL)isNumeric;

Method Name: isNumeric
Parameters: nil
Returns: Returns true if string is numeric else false.

3. NSDate Helper.

+(NSDate *)dateFromString:(NSString*)date format:(NSString*)dateFormat;

Method Name: dateFromString:date format:dateFormat
Parameters: date = A date string in NSString format.
dateFormat = A format of date in which we need to return given date.
Returns: Returns date in NSDate format from given string in given format.

4. NSArray Helper.

-(NSArray*)sortedArrayByKey:(NSString*)key isDesc:(BOOL)desc;

Method Name: sortedArrayByKey:key isDesc:desc
Parameters: key = If there is array of dictionaries then a key is a specific key of those dictionaries with respect of which the array need to be sorted. Else if there is array of Strings then pass a blank key.
desc = a boolean value (true if sorted array in descending order).
Returns: Returns a sorted array.

5. NSMutableDictionary Helper.

-(void)setObjectIfNotNil:(id)object ForKey:(NSString*)aKey;

Method Name: setObjectIfNotNil:object ForKey:aKey
Parameters: object = The value for akey.
aKey = The key for object.
Returns: nil. Adds a given key-value pair to the dictionary if and only if object is not nil.

-(id) getObjectForKey:(NSString *)aKey;

Method Name: getObjectForKey:aKey
Parameters: aKey = The key for which to return the corresponding value.
Returns: Value for the given key if and only if the key exists in the dictionary.

-(NSString*)stringFromKey:(NSString*)key;

Method Name: stringFromKey:key
Parameters: key = The key for which to return the corresponding value.
Returns: Returns value for the given key in a string format.

-(NSNumber*)intFromKey:(NSString*)key;

Method Name: intFromKey:key
Parameters: key = The key for which to return the corresponding value.
Returns: Returns value for the given key in int format.

-(NSNumber*)doubleFromKey:(NSString*)key;

Method Name: doubleFromKey:key
Parameters: key = The key for which to return the corresponding value.
Returns: Returns value for the given key in double format.

-(BOOL)boolForKey:(NSString *)key;

Method Name: boolForKey:key
Parameters: key = The key for which to return the corresponding value.
Returns: Returns boolean value for the given key.

-(void)setFloat:(float)value forKey:(NSString *)key;

Method Name: setFloat:value forKey:key;
Parameters: value = The float value for Key.
key = The key for value.
Returns: nil. Adds a given key-value pair to the dictionary.

-(void)setDouble:(double)value forKey:(NSString *)key;

Method Name: setDouble:value forKey:key;
Parameters: value = The double value for Key.
key = The key for value.
Returns: nil. Adds a given key-value pair to the dictionary.

-(void)setBool:(BOOL)value forKey:(NSString *)key;

Method Name: setBool:value forKey:key;
Parameters: value = The bool value for Key.
key = The key for value.
Returns: nil. Adds a given key-value pair to the dictionary.

-(void)setInt:(int)value forKey:(NSString *)key;

Method Name: setInt:value forKey:key;
Parameters: value = The int value for Key.
key = The key for value.
Returns: nil. Adds a given key-value pair to the dictionary.

6. In-app purchase Manager.

- (void)loadStore:(id)vc forProduct:(NSString*)productName;

Method Name: loadStore:vc forProduct:productName
Parameters: vc = The object of view controller from where we need to call IAP Manager.
productName = The name of the product (product identifier)
Description: It will load the store, fetch the product and make the in app purchase.
For eg.:
[[IAPManager getInstance] loadStore:obj_vc forProduct:@"com.companyname.application.productid"]

7. Location Manager.

- (void) getCurrentLocation;

Method Name: getCurrentLocation
Parameters: vc = nil.
Description: It will start updaing location by the user’s current location.
For eg.:
[[LocationManager getInstance] getCurrentLocation]

8. Validation Manager.

- (BOOL)blankFieldValidation:(NSString *)textfield;

Method Name: blankFieldValidation:textfield
Parameters: textfield = Text/String from textfield.
Returns: True if there is no blank text in the textfield else return false.

- (BOOL)checkPasswordStrength:(NSString *)textfield;

Method Name: checkPasswordStrength:textfield
Parameters: textfield = Text/String from password textfield.
Returns: True if the password strength is greater than or equal to 8 characters else return false.

- (BOOL)emailVerification:(NSString *)emailStr;

Method Name: emailVerification:textfield
Parameters: textfield = Text/String from email textfield.
Returns: True if valid email address else return false.

- (BOOL)validatePhone:(NSString *)phoneNumber;

Method Name: validatePhone:textfield
Parameters: textfield = Text/String from phone textfield.
Returns: True if valid phone number else return false.

- (BOOL)zipcodeVerification:(NSString *)zipCodeStr;

Method Name: zipcodeVerification:textfield
Parameters: textfield = Text/String from zip textfield.
Returns: True if US zipcode else return false.

- (NSDictionary*)getValidationMessageListFromPlist:(NSString *)plistName;

Method Name: getValidationMessageListFromPlist:plistName
Parameters: plistName = Name of the plist from which need to fetch data.
Returns: Plist in the form of NSDictionary.

9. Application Manager

- (void)logout;

Method Name: logout
Parameters: nil
Description: Clears all the value from NSUserDefaults. Delete all logged-in user objects.

- (BOOL)rootCheck;

Method Name: rootCheck
Parameters: nil
Description: Check if device is Jailbroken.
