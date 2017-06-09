//
//  Annotation.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 3. 7..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

- (instancetype) initWithTitle: (NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate{
    self = [super init];
    if (self) {
        self.title = title;
        _coordinate = coordinate;
        //coordinate는 readonly이므로 self.~~ 형태로 사용 불가, setter,getter 중 setter가 생길 수 없기 때문임...따라서 _~~ 로 작성해야 함
    }
    return self;
}


@end
