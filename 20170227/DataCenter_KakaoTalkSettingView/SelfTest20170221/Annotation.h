//
//  Annotation.h
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 3. 7..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject
<MKAnnotation>
//annotation 프로토콜의 사용...델리게이트 하는 것과 다른, 다시 말해 프로토콜 쓰는 것임

@property (nonatomic, copy) NSString *title;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (instancetype) initWithTitle: (NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate;



@end
