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

- (NSDictionary*)getValidationMessageListFromJSON:(NSString *)jsonFileName;

    Method Name: getValidationMessageListFromJSON:jsonFileName
    Parameters: jsonFileName = Name of the json file from which need to fetch data.
    Returns: Converts json data to NSDictionary and returns a dictionary.


9. Application Manager

- (void)logout;

    Method Name: logout
    Parameters: nil
    Description: Clears all the value from NSUserDefaults. Delete all logged-in user objects.

- (BOOL)rootCheck;

    Method Name: rootCheck
    Parameters: nil
    Description: Check if device is Jailbroken.

10. Files Manager

-(id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key;

    Method Name: attributeOfItemAtPath:path forKey:key
    Parameters: path = The path of a file or directory.
                key = Key for the value
    Returns: Returns the value/attribute of the item at a given path for specified key.

-(id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError **)error;

    Method Name: attributeOfItemAtPath:path forKey:key error:error;
    Parameters: path = The path of a file or directory.
                key = Key for the value
                error = You may specify nil for this parameter if you do not want the error information.
    Returns: Returns value/attribute for the key at given path or nil if an error occurred.

-(NSDictionary *)attributesOfItemAtPath:(NSString *)path;

    Method Name: attributesOfItemAtPath:path
    Parameters: path = The path of a file or directory.
    Returns: Returns an NSDictionary object as the attributes of the item at a given path.

-(NSDictionary *)attributesOfItemAtPath:(NSString *)path error:(NSError **)error;

    Method Name: attributesOfItemAtPath:path
    Parameters: path = The path of a file or directory.
                error = You may specify nil for this parameter if you do not want the error information.
    Returns: Returns an NSDictionary object as the attribute of the item at a given path or nil if an error occurred.

-(BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath;

    Method Name: copyItemAtPath:path toPath:toPath
    Parameters: path = The source path of an item.
                toPath = The destination path of an item.
    Returns: Returns true if item gets copied else false.

-(BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;

    Method Name: copyItemAtPath:path toPath:toPath error:error
    Parameters: path = The source path of an item.
                toPath = The destination path of an item.
                error = You may specify nil for this parameter if you do not want the error information.
    Returns: Returns true if item gets copied else false or nil if an error occurred.

-(BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;

    Method Name: copyItemAtPath:path toPath:toPath overwrite:overwrite
    Parameters: path = The source path of an item.
                toPath = The destination path of an item.
                overwrite = A boolean value.
    Returns: Returns true if item gets copied else false.

-(BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;

    Method Name: copyItemAtPath:path toPath:toPath overwrite:overwrite error:error
    Parameters: path = The source path of an item.
                toPath = The destination path of an item.
                overwrite = A boolean value.
                error = You may specify nil for this parameter if you do not want the error information.
    Returns: Returns true if item gets copied else false or nil if an error occurred.

-(BOOL)createDirectoriesForFileAtPath:(NSString *)path;

    Method Name: createDirectoriesForFileAtPath:path
    Parameters: path = The source path of an item.
    Returns: Creates a directory with given attributes at the specified path. Returns true if the directory was created, or false if an error occurred.

-(BOOL)createDirectoriesForFileAtPath:(NSString *)path error:(NSError **)error;

    Method Name: createDirectoriesForFileAtPath:path
    Parameters: path = The source path of an item.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Creates a directory with given attributes at the specified path. Returns true if the directory was created, or false if an error occurred.

-(BOOL)createDirectoriesForPath:(NSString *)path;

    Method Name: createDirectoriesForPath:path
    Parameters: path = The source path of an item.
    Returns: Creates a directory with given attributes at the specified path. Returns true if the directory was created, or false if an error occurred.

-(BOOL)createDirectoriesForPath:(NSString *)path error:(NSError **)error;

    Method Name: createDirectoriesForPath:path
    Parameters: path = The source path of an item.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Creates a directory with given attributes at the specified path. Returns true if the directory was created, or false if an error occurred.

-(BOOL)createFileAtPath:(NSString *)path;

    Method Name: createFileAtPath:path
    Parameters: path = The source path of an item.
    Returns: Creates a file with given attributes at the specified path. Returns true if the directory was created, or false if an error occurred.

-(BOOL)createFileAtPath:(NSString *)path error:(NSError **)error;

    Method Name: createFileAtPath:path
    Parameters: path = The source path of an item.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Creates a file with given attributes at the specified path. Returns true if the directory was created, or false if an error occurred.

-(BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite;

    Method Name: createFileAtPath:path
    Parameters: path = The source path of an item.
                overwrite = A boolean specifies to overwrite existing file or not.
    Returns: Creates a file with given attributes at the specified path. Returns true if the directory was created, or false if an error occurred.

-(BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite error:(NSError **)error;

    Method Name: createFileAtPath:path overwrite:overwrite error:error
    Parameters: path = The source path of an item.
                overwrite = A boolean specifies to overwrite existing file or not.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Creates a file with given attributes at the specified path. Returns true if the directory was created, or false if an error occurred.

-(BOOL)createFileAtPath:(NSString *)path withContent:(NSObject *)content;

    Method Name: createFileAtPath:path withContent:content
    Parameters: path = The source path of an item.
                content = An NSObject type of object.
    Returns: Writes the content in the receiver to the file specified by a given path. Returns true if the operation succeeds, otherwise false.

-(BOOL)createFileAtPath:(NSString *)path withContent:(NSObject *)content error:(NSError **)error;

    Method Name: createFileAtPath:path withContent:content error:error
    Parameters: path = The source path of an item.
                content = An NSObject type of object.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Writes the content in the receiver to the file specified by a given path. Returns true if the operation succeeds, otherwise false in case of any error.

-(BOOL)createFileAtPath:(NSString *)path withContent:(NSObject *)content overwrite:(BOOL)overwrite;

    Method Name: createFileAtPath:path withContent:content overwrite:overwrite
    Parameters: path = The source path of an item.
                content = An NSObject type of object.
                overwrite = A boolean specifies to overwrite existing file or not.
    Returns: Writes the content in the receiver to the file specified by a given path. Returns true if the operation succeeds, otherwise false in case of any error.

-(BOOL)createFileAtPath:(NSString *)path withContent:(NSObject *)content overwrite:(BOOL)overwrite error:(NSError **)error;

    Method Name: createFileAtPath:path withContent:content overwrite:overwrite error:error
    Parameters: path = The source path of an item.
                content = An NSObject type of object.
                overwrite = A boolean specifies to overwrite existing file or not.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Writes the content in the receiver to the file specified by a given path. Returns true if the operation succeeds, otherwise false in case of any error.

-(NSDate *)creationDateOfItemAtPath:(NSString *)path;

    Method Name: creationDateOfItemAtPath:path
    Parameters: path = The source path of an item.
    Returns: Date in NSDate format which is the key NSFileCreationDate in a file attribute dictionary at a given path whose value indicates the file's creation date.

-(NSDate *)creationDateOfItemAtPath:(NSString *)path error:(NSError **)error;

    Method Name: creationDateOfItemAtPath:path error:error
    Parameters: path = The source path of an item.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Date in NSDate format which is the key NSFileCreationDate in a file attribute dictionary at a given path whose value indicates the file's creation date or nil in case of any error.

-(BOOL)emptyCachesDirectory;

    Method Name: emptyCachesDirectory
    Parameters: nil
    Returns: Removes all the files or directories at the NSCachesDirectory. Returns true if the items were removed successfully or if path was nil. Returns false if an error occurred.

-(BOOL)emptyTemporaryDirectory;

    Method Name: emptyCachesDirectory
    Parameters: nil
    Returns: Removes all the files or directories at the NSTemporaryDirectory. Returns true if the items were removed successfully or if path was nil. Returns false if an error occurred.

-(BOOL)existsItemAtPath:(NSString *)path;

    Method Name: existsItemAtPath:path
    Parameters: path = The path of the file or directory.
    Returns: Returns trueS if a file at the specified path exists, or false if the file does not exist or its existence could not be determined.


-(BOOL)isDirectoryItemAtPath:(NSString *)path;

    Method Name: isDirectoryItemAtPath:path
    Parameters: path = The path of the file or directory.
    Returns: Returns true if a file at the specified path exists, or false if the file does not exist or its existence could not be determined.

-(BOOL)isDirectoryItemAtPath:(NSString *)path error:(NSError **)error;

    Method Name: isDirectoryItemAtPath:path error:error
    Parameters: path = The path of the file or directory.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns true if a file at the specified path exists, or false if the file does not exist or its existence could not be determined or an error occurred.

-(BOOL)isEmptyItemAtPath:(NSString *)path;

    Method Name: isEmptyItemAtPath:path
    Parameters: path = The path of the file or directory.
    Returns: Returns true if there is no file exists at the specified path, or false if any file exist.

-(BOOL)isEmptyItemAtPath:(NSString *)path error:(NSError **)error;

    Method Name: isEmptyItemAtPath:path
    Parameters: path = The path of the file or directory.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns true if there is no file exists at the specified path, or false if any file exist or if any error occurred.

-(BOOL)isFileItemAtPath:(NSString *)path;

    Method Name: isFileItemAtPath:path
    Parameters: path = The path of the file or directory.
    Returns: Returns true if item at the specified path is NSFileTypeRegular else false.

-(BOOL)isFileItemAtPath:(NSString *)path error:(NSError **)error;

    Method Name: isFileItemAtPath:path error:error
    Parameters: path = The path of the file or directory.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns true if item at the specified path is NSFileTypeRegular else false if any error occurred.

-(BOOL)isExecutableItemAtPath:(NSString *)path;

    Method Name: isExecutableItemAtPath:path
    Parameters: path = The path of the file.
    Returns: Returns true if the current process has execute privileges for the file at path else false if the process does not have execute privileges or the existence of the file could not be determined.

-(BOOL)isReadableItemAtPath:(NSString *)path;

    Method Name: isReadableItemAtPath:path
    Parameters: path = The path of the file.
    Returns: Returns true if the current process has read privileges for the file at path else false if the process does not have read privileges or the existence of the file could not be determined.

-(BOOL)isWritableItemAtPath:(NSString *)path;

    Method Name: isWritableItemAtPath:path
    Parameters: path = The path of the file.
    Returns: Returns true if the current process has write privileges for the file at path else false if the process does not have write privileges or the existence of the file could not be determined.

-(NSArray *)listDirectoriesInDirectoryAtPath:(NSString *)path;

    Method Name: listDirectoriesInDirectoryAtPath:path
    Parameters: path = The path of the directory.
    Returns: Returns an array of child directories at the specific directory path.

-(NSArray *)listDirectoriesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep;

    Method Name: listDirectoriesInDirectoryAtPath:path deep:deep
    Parameters: path = The path of the directory.
                deep = A boolean value specified fetching of subpaths of directory path.
    Returns: Returns an array of child directories at the specific directory path.

-(NSArray *)listFilesInDirectoryAtPath:(NSString *)path;

    Method Name: listFilesInDirectoryAtPath:path
    Parameters: path = The path of the directory.
    Returns: Returns an array contains list of all the files at the specific directory path.

-(NSArray *)listFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep;

    Method Name: listFilesInDirectoryAtPath:path deep:deep
    Parameters: path = The path of the directory.
                deep = A boolean value specified fetching of subpaths of directory path.
    Returns: Returns an array contains list of all the files at the specific directory path.

-(NSArray *)listFilesInDirectoryAtPath:(NSString *)path withExtension:(NSString *)extension;

    Method Name: listFilesInDirectoryAtPath:path withExtension:extension
    Parameters: path = The path of the directory.
                extension = A string specified the file extension.
    Returns: Returns an array contains list of all the files with the specific extension at the specific directory path.

-(NSArray *)listFilesInDirectoryAtPath:(NSString *)path withExtension:(NSString *)extension deep:(BOOL)deep;

    Method Name: listFilesInDirectoryAtPath:path withExtension:extension deep:deep
    Parameters: path = The path of the directory.
                extension = A string specified the file extension.
                deep = A boolean value specified fetching of subpaths of directory path.
    Returns: Returns an array contains list of all the files with the specific extension at the specific directory path.

-(NSArray *)listFilesInDirectoryAtPath:(NSString *)path withPrefix:(NSString *)prefix;

    Method Name: listFilesInDirectoryAtPath:path withPrefix:prefix
    Parameters: path = The path of the directory.
                prefix = A string specified the file prefix.
    Returns: Returns an array contains list of all the files with the specific prefix at the specific directory path.

-(NSArray *)listFilesInDirectoryAtPath:(NSString *)path withPrefix:(NSString *)prefix deep:(BOOL)deep;

    Method Name: listFilesInDirectoryAtPath:path withPrefix:prefix deep:deep
    Parameters: path = The path of the directory.
                prefix = A string specified the file prefix.
                deep = A boolean value specified fetching of subpaths of directory path.
    Returns: Returns an array contains list of all the files with the specific prefix at the specific directory path.

-(NSArray *)listFilesInDirectoryAtPath:(NSString *)path withSuffix:(NSString *)suffix;

    Method Name: listFilesInDirectoryAtPath:path withSuffix:suffix
    Parameters: path = The path of the directory.
                suffix = A string specified the file suffix.
    Returns: Returns an array contains list of all the files with the specific suffix at the specific directory path.

-(NSArray *)listFilesInDirectoryAtPath:(NSString *)path withSuffix:(NSString *)suffix deep:(BOOL)deep;

    Method Name: listFilesInDirectoryAtPath:path withSuffix:suffix deep:deep
    Parameters: path = The path of the directory.
                suffix = A string specified the file suffix.
                deep = A boolean value specified fetching of subpaths of directory path.
    Returns: Returns an array contains list of all the files with the specific suffix at the specific directory path.

-(NSArray *)listItemsInDirectoryAtPath:(NSString *)path deep:(BOOL)deep;

    Method Name: listItemsInDirectoryAtPath:path deep:deep
    Parameters: path = The path of the directory.
                deep = A boolean value specified fetching of subpaths of directory path.
    Returns: Returns an array contains list of all the items in the directory at the specific directory path.

-(BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath;

    Method Name: moveItemAtPath:path toPath:toPath
    Parameters: path = The initial file path of the item.
                toPath = The final file path of the item.
    Returns: Returns true if successfully moved item at final path else false if any error occurred.

-(BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;

    Method Name: moveItemAtPath:path toPath:toPath error:error
    Parameters: path = The initial file path of the item.
                toPath = The final file path of the item.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns true if successfully moved item at final path else false if any error occurred.

-(BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;

    Method Name: moveItemAtPath:path toPath:toPath overwrite:overwrite
    Parameters: path = The initial file path of the item.
                toPath = The final file path of the item.
                overwrite = A boolean specifies to overwrite existing item or not.
    Returns: Returns true if successfully moved item at final path else false if any error occurred.

-(BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;

    Method Name: moveItemAtPath:path toPath:toPath overwrite:overwrite error:error
    Parameters: path = The initial file path of the item.
                toPath = The final file path of the item.
                overwrite = A boolean specifies to overwrite existing item or not.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns true if successfully moved item at final path else false if any error occurred.

-(NSString *)pathForApplicationSupportDirectory;

    Method Name: pathForApplicationSupportDirectory
    Parameters: nil
    Returns: Returns a string specified location of application support files (Library/Application Support)(NSApplicationSupportDirectory).

-(NSString *)pathForApplicationSupportDirectoryWithPath:(NSString *)path;

    Method Name: pathForApplicationSupportDirectoryWithPath:path
    Parameters: path = A file path.
    Returns: Returns string made by appending a string specified location of application support files (Library/Application Support)(NSApplicationSupportDirectory) to the path, preceded if necessary by a path separator.

-(NSString *)pathForCachesDirectory;

    Method Name: pathForCachesDirectory
    Parameters: nil.
    Returns: Returns a string specified location of discardable cache files (Library/Caches)(NSCachesDirectory).

-(NSString *)pathForCachesDirectoryWithPath:(NSString *)path;

    Method Name: pathForCachesDirectoryWithPath:path
    Parameters: path = A file path.
    Returns: Returns string made by appending a string specified location of discardable cache files (Library/Caches)(NSCachesDirectory) to the path, preceded if necessary by a path separator.

-(NSString *)pathForDocumentsDirectory;

    Method Name: pathForDocumentsDirectory
    Parameters: nil.
    Returns: Returns a string specified location of Document directory (NSDocumentDirectory).

-(NSString *)pathForDocumentsDirectoryWithPath:(NSString *)path;

    Method Name: pathForDocumentsDirectoryWithPath:path
    Parameters: path = A file path.
    Returns: Returns string made by appending a string specified location of Document directory (NSDocumentDirectory) to the path, preceded if necessary by a path separator.

-(NSString *)pathForLibraryDirectory;

    Method Name: pathForLibraryDirectory
    Parameters: nil.
    Returns: Returns a string specified various user-visible documentation, support, and configuration files (/Library) (NSLibraryDirectory).

-(NSString *)pathForLibraryDirectoryWithPath:(NSString *)path;

    Method Name: pathForLibraryDirectoryWithPath:path
    Parameters: path = A file path.
    Returns: Returns string made by appending a string specified various user-visible documentation, support, and configuration files (/Library) (NSLibraryDirectory) to the path, preceded if necessary by a path separator.

-(NSString *)pathForMainBundleDirectory;

    Method Name: pathForMainBundleDirectory
    Parameters: nil.
    Returns: Returns a string of the full pathname of the bundle’s subdirectory containing resources.

-(NSString *)pathForMainBundleDirectoryWithPath:(NSString *)path;

    Method Name: pathForMainBundleDirectoryWithPath:path
    Parameters: path = A file path.
    Returns: Returns string made by appending a string of the full pathname of the bundle’s subdirectory containing resources to the path, preceded if necessary by a path separator.

-(NSString *)pathForPlistNamed:(NSString *)name;

    Method Name: pathForPlistNamed:name
    Parameters: name = Name of plist file.
    Returns: Returns a string specified path of the plist file.

-(NSString *)pathForTemporaryDirectory;

    Method Name: pathForTemporaryDirectory
    Parameters: nil.
    Returns: Returns path for the temporary directory.

-(NSString *)pathForTemporaryDirectoryWithPath:(NSString *)path;

    Method Name: pathForTemporaryDirectoryWithPath:path
    Parameters: path = A file path.
    Returns: Returns string made by appending path for the temporary directory to the path, preceded if necessary by a path separator.

-(NSString *)readFileAtPath:(NSString *)path;

    Method Name: readFileAtPath:path
    Parameters: path = A file path.
    Returns: Returns a string created by reading data from the file at a given path interpreted using a given encoding.

-(NSString *)readFileAtPath:(NSString *)path error:(NSError **)error;

    Method Name: readFileAtPath:path
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns a string created by reading data from the file at a given path interpreted using a given encoding else nil if any error occurred.

-(NSArray *)readFileAtPathAsArray:(NSString *)path;

    Method Name: readFileAtPathAsArray:path
    Parameters: path = A file path.
    Returns: Creates and returns an array containing the contents of the file specified by a given path.

-(NSObject *)readFileAtPathAsCustomModel:(NSString *)path;

    Method Name: readFileAtPathAsCustomModel:path
    Parameters: path = A file path.
    Returns: Returns the object graph previously encoded by NSKeyedArchiver written to the file path.

-(NSData *)readFileAtPathAsData:(NSString *)path;

    Method Name: readFileAtPathAsData:path
    Parameters: path = A file path.
    Returns: A data object by reading every byte from the file specified by path.

-(NSData *)readFileAtPathAsData:(NSString *)path error:(NSError **)error;

    Method Name: readFileAtPathAsData:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: A data object by reading every byte from the file specified by path else nil if any error occurred.

-(NSDictionary *)readFileAtPathAsDictionary:(NSString *)path;

    Method Name: readFileAtPathAsDictionary:path
    Parameters: path = A file path.
    Returns: A new dictionary that contains the dictionary at path, or nil if there is a file error or if the contents of the file are an invalid representation of a dictionary.

-(UIImage *)readFileAtPathAsImage:(NSString *)path;

    Method Name: readFileAtPathAsImage:path
    Parameters: path = A file path.
    Returns: Returns image from the data (data by reading file at specific path).

-(UIImage *)readFileAtPathAsImage:(NSString *)path error:(NSError **)error;

    Method Name: readFileAtPathAsImage:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns image from the data (data by reading file at specific path).

-(UIImageView *)readFileAtPathAsImageView:(NSString *)path;

    Method Name: readFileAtPathAsImageView:path
    Parameters: path = A file path.
    Returns: Returns an image view initialized with the specified image, from the data (data by reading file at specific path).

-(UIImageView *)readFileAtPathAsImageView:(NSString *)path error:(NSError **)error;

    Method Name: readFileAtPathAsImageView:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns an image view initialized with the specified image, from the data (data by reading file at specific path).

-(NSJSONSerialization *)readFileAtPathAsJSON:(NSString *)path;

    Method Name: readFileAtPathAsJSON:path
    Parameters: path = A file path.
    Returns: Returns a Foundation object from the JSON data in data(data by reading file at specific path), or nil if an error occurs.

-(NSJSONSerialization *)readFileAtPathAsJSON:(NSString *)path error:(NSError **)error;

    Method Name: readFileAtPathAsJSON:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns a Foundation object from the JSON data in data(data by reading file at specific path), or nil if an error occurs.

-(NSMutableArray *)readFileAtPathAsMutableArray:(NSString *)path;

    Method Name: readFileAtPathAsMutableArray:path
    Parameters: path = A file path.
    Returns: Returns a mutable array containing the contents of the file specified aPath.

-(NSMutableData *)readFileAtPathAsMutableData:(NSString *)path;

    Method Name: readFileAtPathAsMutableData:path
    Parameters: path = A file path.
    Returns: Returns a data object by reading every byte from the file specified by path.

-(NSMutableData *)readFileAtPathAsMutableData:(NSString *)path error:(NSError **)error;

    Method Name: readFileAtPathAsMutableData:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns a data object by reading every byte from the file specified by path, or nil if an error occurs.

-(NSMutableDictionary *)readFileAtPathAsMutableDictionary:(NSString *)path;

    Method Name: readFileAtPathAsMutableDictionary:path
    Parameters: path = A file path.
    Returns: Returns a new dictionary that contains the dictionary at path, or nil if there is a file error or if the contents of the file are an invalid representation of a dictionary.

-(NSString *)readFileAtPathAsString:(NSString *)path;

    Method Name: readFileAtPathAsString:path 
    Parameters: path = A file path.
    Returns: Returns a string created by reading data from the file named by path using the encoding, enc.

-(NSString *)readFileAtPathAsString:(NSString *)path error:(NSError **)error;

    Method Name: readFileAtPathAsString:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns a string created by reading data from the file named by path using the encoding, enc.

-(BOOL)removeFilesInDirectoryAtPath:(NSString *)path;

    Method Name: removeFilesInDirectoryAtPath:path 
    Parameters: path = A file path.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeFilesInDirectoryAtPath:(NSString *)path error:(NSError **)error;

    Method Name: removeFilesInDirectoryAtPath:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeFilesInDirectoryAtPath:(NSString *)path withExtension:(NSString *)extension;

    Method Name: removeFilesInDirectoryAtPath:path withExtension:extension
    Parameters: path = A file path.
                extension = A file extension.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeFilesInDirectoryAtPath:(NSString *)path withExtension:(NSString *)extension error:(NSError **)error;

    Method Name: removeFilesInDirectoryAtPath:path withExtension:extension error:error
    Parameters: path = A file path.
                extension = A file extension.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeFilesInDirectoryAtPath:(NSString *)path withPrefix:(NSString *)prefix;

    Method Name: removeFilesInDirectoryAtPath:path withPrefix:prefix
    Parameters: path = A file path.
                prefix = A file prefix.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeFilesInDirectoryAtPath:(NSString *)path withPrefix:(NSString *)prefix error:(NSError **)error;

    Method Name: removeFilesInDirectoryAtPath:path withPrefix:prefix error:error
    Parameters: path = A file path.
                prefix = A file prefix.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeFilesInDirectoryAtPath:(NSString *)path withSuffix:(NSString *)suffix;

    Method Name: removeFilesInDirectoryAtPath:path withSuffix:suffix 
    Parameters: path = A file path.
    suffix = A file suffix.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeFilesInDirectoryAtPath:(NSString *)path withSuffix:(NSString *)suffix error:(NSError **)error;

    Method Name: removeFilesInDirectoryAtPath:path withSuffix:suffix error:error
    Parameters: path = A file path.
                suffix = A file suffix.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeItemsInDirectoryAtPath:(NSString *)path;

    Method Name: removeItemsInDirectoryAtPath:path error:error
    Parameters: path = A file path.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeItemsInDirectoryAtPath:(NSString *)path error:(NSError **)error;

    Method Name: removeItemsInDirectoryAtPath:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeItemAtPath:(NSString *)path;

    Method Name: removeItemAtPath:path error:error
    Parameters: path = A file path.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error;

    Method Name: removeItemAtPath:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Removes the file or directory at the specified path. Returns YES if the item was removed successfully or if path was nil.

-(BOOL)renameItemAtPath:(NSString *)path withName:(NSString *)name;

    Method Name: renameItemAtPath:path withName:name error:error
    Parameters: path = A file path.
    name = A new name of item.
    Returns: Returns YES if the item was renamed successfully or if path was nil.

-(BOOL)renameItemAtPath:(NSString *)path withName:(NSString *)name error:(NSError **)error;

    Method Name: renameItemAtPath:path withName:name error:error
    Parameters: path = A file path.
                name = A new name of item.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns YES if the item was renamed successfully or if path was nil.

-(NSString *)sizeFormatted:(NSNumber *)size;

    Method Name: sizeFormatted:size
    Parameters: path = A file path.
                size = A number specified size.
    Returns: Returns a formatted string for specified size.

-(NSString *)sizeFormattedOfDirectoryAtPath:(NSString *)path;

    Method Name: sizeFormattedOfDirectoryAtPath:path error:error
    Parameters: path = A directory path.
    Returns: Returns directory size.

-(NSString *)sizeFormattedOfDirectoryAtPath:(NSString *)path error:(NSError **)error;

    Method Name: sizeFormattedOfDirectoryAtPath:path error:error
    Parameters: path = A directory path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns directory size.

-(NSString *)sizeFormattedOfFileAtPath:(NSString *)path;

    Method Name: sizeFormattedOfFileAtPath:path error:error
    Parameters: path = A file path.
    Returns: Returns file size.

-(NSString *)sizeFormattedOfFileAtPath:(NSString *)path error:(NSError **)error;

    Method Name: sizeFormattedOfFileAtPath:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns file size.

-(NSString *)sizeFormattedOfItemAtPath:(NSString *)path;

    Method Name: sizeFormattedOfItemAtPath:path error:error
    Parameters: path = A item path.
    Returns: Returns item size.

-(NSString *)sizeFormattedOfItemAtPath:(NSString *)path error:(NSError **)error;

    Method Name: sizeFormattedOfItemAtPath:path error:error
    Parameters: path = A item path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns item size.

-(NSNumber *)sizeOfDirectoryAtPath:(NSString *)path;

    Method Name: sizeOfDirectoryAtPath:path error:error
    Parameters: path = A Directory path.
    Returns: Returns Directory size.

-(NSNumber *)sizeOfDirectoryAtPath:(NSString *)path error:(NSError **)error;

    Method Name: sizeOfDirectoryAtPath:path error:error
    Parameters: path = A Directory path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns Directory size.

-(NSNumber *)sizeOfFileAtPath:(NSString *)path;

    Method Name: sizeOfFileAtPath:path 
    Parameters: path = A file path.
    Returns: Returns file size.

-(NSNumber *)sizeOfFileAtPath:(NSString *)path error:(NSError **)error;

    Method Name: sizeOfFileAtPath:path error:error
    Parameters: path = A file path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns file size.

-(NSNumber *)sizeOfItemAtPath:(NSString *)path;

    Method Name: sizeOfItemAtPath:path 
    Parameters: path = A item path.
    Returns: Returns item size.

-(NSNumber *)sizeOfItemAtPath:(NSString *)path error:(NSError **)error;

    Method Name: sizeOfItemAtPath:path error:error
    Parameters: path = A item path.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Returns item size.

-(NSURL *)urlForItemAtPath:(NSString *)path;

    Method Name: urlForItemAtPath:path 
    Parameters: path = A item path.
    Returns: Returns an NSURL object initialized with path, or nil if path is zero-length.

-(BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content;

    Method Name: writeFileAtPath:path content:content 
    Parameters: path = A file path.
                content = A object specifying content.
    Returns: Writes the content in the receiver to the file specified by a given path. Returns YES if the operation succeeds, otherwise NO.

-(BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error;

    Method Name: writeFileAtPath:path content:content error:error
    Parameters: path = A file path.
                content = A object specifying content.
                error = A pointer to an error object. If do not want error information specify nil for this parameter.
    Returns: Writes the content in the receiver to the file specified by a given path. Returns YES if the operation succeeds, otherwise NO.

-(NSDictionary *)metadataOfImageAtPath:(NSString *)path;

    Method Name: metadataOfImageAtPath:path
    Parameters: path = A file path.
    Returns: A dictionary specified metadata of an image at specific path.

-(NSDictionary *)exifDataOfImageAtPath:(NSString *)path;

    Method Name: exifDataOfImageAtPath:path
    Parameters: path = A file path.
    Returns: A dictionary of key-value pairs for an image that uses Exchangeable Image File Format (EXIF) from metadata specified at specific path.

-(NSDictionary *)tiffDataOfImageAtPath:(NSString *)path;

    Method Name: tiffDataOfImageAtPath:path
    Parameters: path = A file path.
    Returns: A dictionary of key-value pairs for an image that uses Tagged Image File Format (TIFF) from metadata specified at specific path.

-(NSDictionary *)xattrOfItemAtPath:(NSString *)path;

    Method Name: xattrOfItemAtPath:path
    Parameters: path = A file path.
    Returns: A dictionary of key-value at specific path.

-(NSString *)xattrOfItemAtPath:(NSString *)path getValueForKey:(NSString *)key;

    Method Name: xattrOfItemAtPath:path getValueForKey:key
    Parameters: path = A file path.
                key = A key for value
    Returns: Returns the string-value stored for the specified key, if the key doesn't exist returns nil.

-(BOOL)xattrOfItemAtPath:(NSString *)path hasValueForKey:(NSString *)key;

    Method Name: xattrOfItemAtPath:path hasValueForKey:key
    Parameters: path = A file path.
                key = A key for value
    Returns: Returns true if string-value stored for the specified key else false.

-(BOOL)xattrOfItemAtPath:(NSString *)path removeValueForKey:(NSString *)key;

    Method Name: xattrOfItemAtPath:path removeValueForKey:key
    Parameters: path = A file path.
                key = A key for value
    Returns: Returns true if the string-value stored for the specified key is removed else false.

-(BOOL)xattrOfItemAtPath:(NSString *)path setValue:(NSString *)value forKey:(NSString *)key;

    Method Name: xattrOfItemAtPath:path setValue:value forKey:key
    Parameters: path = A file path.
                value = A value for key
                key = A key for value
    Returns: Returns true if set the specified string-value and returns a BOOL result of the operation else false.

11. NSDictionary Helper.

-(NSString*) bv_jsonStringWithPrettyPrint:(BOOL) prettyPrint;

    Method Name: bv_jsonStringWithPrettyPrint:prettyPrint
    Parameters: prettyPrint = A boolean value that specifies that the JSON data should be generated with whitespace designed to make the output more readable. If this option is not set, the most compact possible JSON representation is generated.
    Returns: Returns NSString from NSDictionary.
