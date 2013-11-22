//
//  CustomerModel.h
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomerModel : NSObject

@property(nonatomic,strong) NSNumber *Id;
@property(nonatomic,strong) NSString *Firstname;
@property(nonatomic,strong) NSString *Lastname;
@property(nonatomic,strong) NSString *Birthdate;
@property(nonatomic,strong) NSString *Email;
@property(nonatomic,strong) NSString *Address;
@property(nonatomic,strong) NSString *Country;
@property(nonatomic,strong) NSString *City;
@property(nonatomic,strong) NSString *Phone;
@property(nonatomic,strong) NSString *Fullname;
@property(nonatomic,strong) NSNumber *IsActive;
@property(nonatomic,strong) NSString *IndexValue;

- (id)initWithJsonData:(NSDictionary *)data;

@end


/*
 
 "Customers":[
 {
 "Id":1,
 "Firstname":"Sam",
 "Lastname":"Witwicky",
 "Birthdate":"03-30-14",
 "Email":"ladiesman@reallyhotmail.com",
 "Address":"Ap #134-2999 Per Rd.",
 "Country":"Brunei",
 "City":"Urbe",
 "Phone":"123-456-789",
 "IsActive":true
 }
 
 */