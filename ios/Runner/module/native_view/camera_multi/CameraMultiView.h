//
//  CameraMultiView.h
//  Runner
//
//  Created by JunCook on 22/7/25.
//

#import <UIKit/UIKit.h>

@interface CameraMultiView : UIView

- (instancetype)initWithUUID:(NSString *)uuid
                         pass:(NSString *)pass
                        width:(CGFloat)width
                       height:(CGFloat)height;

@end

