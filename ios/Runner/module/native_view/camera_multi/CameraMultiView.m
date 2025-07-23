//
//  CameraMultiView.m
//  Runner
//
//  Created by JunCook on 22/7/25.
//

#import "CameraMultiView.h"

@implementation CameraMultiView {
    NSString *_uuid;
    NSString *_pass;
    CGFloat _width;
    CGFloat _height;
}

- (instancetype)initWithUUID:(NSString *)uuid
                         pass:(NSString *)pass
                        width:(CGFloat)width
                       height:(CGFloat)height {
    CGRect frame = CGRectMake(0, 0, width, height);
    self = [super initWithFrame:frame];
    if (self) {
        _uuid = uuid;
        _pass = pass;
        _width = width;
        _height = height;
        
        self.backgroundColor = [UIColor darkGrayColor];
        
        // Label test thông tin
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.numberOfLines = 2;
        label.text = [NSString stringWithFormat:@"UUID: %@\nPASS: %@\n%.0fx%.0f", uuid, pass, width, height];
        [self addSubview:label];
    }
    return self;
}

@end
