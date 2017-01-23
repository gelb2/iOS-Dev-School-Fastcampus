//
//  main.m
//  Exam0120
//
//  Created by youngmin joo on 2017. 1. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Man.h"
#import "Woman.h"
#import "Bank.h"


int main(int argc, const char * argv[]) {
    //1-5번
    Man *man = [[Man alloc] init];
    man.name = @"비";
    man.asset = 100000000000;
    

    Woman *woman = [[Woman alloc] init];
    woman.name = @"김태희";
    woman.asset = 50000000000;
    
    Bank *wooriBank = [[Bank alloc] init];
    wooriBank.name = @"우리";
    wooriBank.location = @"압구정동 653-1번지";
    
    
    //1-6번
    [man depositOfWon:700 toBank:wooriBank];
    [woman depositOfWon:500 toBank:wooriBank];
    
    //1-7번
    [man checkAccountOfBank:wooriBank];
    [woman checkAccountOfBank:wooriBank];
    
    //1-8번
    [wooriBank changeLocation:@"제주 아일랜드"];
    
    //1-9번
    [wooriBank transferToPerson:woman fromPerson:man transferMoney:10000000000];
    
    return 0;
}
