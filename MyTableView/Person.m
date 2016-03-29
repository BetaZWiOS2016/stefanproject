//
//  Person.m
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)init{
    return [self initWithFname:@"empty" andLName:@"empty"];
}

-(id) initWithFname:(NSString *)voornaam andLName:(NSString*) achternaam{
    self = [super init];
    if (self) {
        self.achternaam = achternaam;
        self.voornaam = voornaam;
        self.wage = 0;
    }
    return self;
}

-(NSString *) volledigenaam{
    return [NSString stringWithFormat:@"%@ %@",self.voornaam,self.achternaam ];
}
-(NSString *)description{
    return [self volledigenaam];
}
+(NSArray *) fetchpeople{
   
    Person *pers = [[Person alloc] initWithFname:@"Florian" andLName:@"Praile"];
    Person *pers1 = [[Person alloc] initWithFname:@"Stefan" andLName:@"Faes"];
    Person *pers2 = [[Person alloc] initWithFname:@"Bart" andLName:@"Goormans"];
    Person *pers3 = [[Person alloc] initWithFname:@"Jens" andLName:@"Flop"];
    Person *pers4 = [[Person alloc] initWithFname:@"Christine" andLName:@"Van Eynde"];
    Person *pers5 = [[Person alloc] initWithFname:@"Jens" andLName:@"Peeters"];
    Person *pers6 = [[Person alloc] initWithFname:@"Johan" andLName:@"Snels"];
    Person *pers7 = [[Person alloc] initWithFname:@"Mathias" andLName:@"Stroobaerts"];
    Person *pers8 = [[Person alloc] initWithFname:@"Justin" andLName:@"Berg"];
    Person *pers9 = [[Person alloc] initWithFname:@"Max" andLName:@"Jones"];
 
    
    return @[pers,pers1,pers2,pers3,pers4,pers5,pers6,pers7,pers8,pers9];
}
@end
