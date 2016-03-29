//
//  Person.h
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong,nonatomic) NSString *voornaam;
@property (strong,nonatomic) NSString *achternaam;
@property (assign,nonatomic) NSInteger wage;


-(NSString *) volledigenaam;
+(NSArray *) fetchpeople;


-(id) initWithFname:(NSString *)voornaam andLName:(NSString*) achternaam;

@end


