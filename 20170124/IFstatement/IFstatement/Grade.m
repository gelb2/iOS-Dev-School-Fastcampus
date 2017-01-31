//
//  Grade.m
//  IFstatement
//
//  Created by ji jun young on 2017. 1. 24..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Grade.h"

@implementation Grade


+ (NSInteger) GradeCalculation: (NSInteger)score
{
    if (score>95) {NSLog(@"A+입니다");
    
    } else if (score<=95&&score>=90){NSLog(@"A입니다");
        
    }
    else if (score<=89&&score>=85){NSLog(@"B+입니다");
        
    }
    else if (score<=84&&score>=80){NSLog(@"B입니다");
        
    }
    else if (score<=79&&score>=70){NSLog(@"C입니다");
        
    }
    else {
        NSLog(@"F입니다");
    }
    
    return 0;
}

@end
