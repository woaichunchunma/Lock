//
//  AniView.m
//  QSyihz
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 yihuazhuan. All rights reserved.
//

#import "AniView.h"

@interface AniView () {
    BOOL isStrat;
}
@property (strong ,nonatomic)UIImageView *centeImageView;
@property (strong, nonatomic)UIImageView *leftImageView;
@property (strong, nonatomic)UIImageView *rightImageView;
@property (strong, nonatomic)UIImageView *subLeftImageView;
@property (strong, nonatomic)UIImageView *subRightImageView;
@property (assign, nonatomic)CGRect centerFrame;
@end

@implementation AniView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [[self layer] setShadowOffset:CGSizeMake(1, 1)];
        [[self layer] setShadowRadius:5];
        [[self layer] setShadowOpacity:1];
        [[self layer] setShadowColor:[UIColor blackColor].CGColor];
        
        CGFloat centerIVW = 50;
        CGFloat centerX = (self.width - centerIVW)/2;
        CGFloat centerY = (self.height - centerIVW)/2;
        self.centerFrame = CGRectMake(centerX, centerY, centerIVW, centerIVW);
        UIImageView *centeImageView = [[UIImageView alloc] initWithFrame:self.centerFrame];
        centeImageView.image = CenterImage;
        [self addSubview:centeImageView];
        self.centeImageView = centeImageView;
        
        CGFloat leftX = 20;
        CGFloat leftY = centerY;
        CGFloat leftW = centerIVW;
        
        UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, leftY, leftW, leftW)];
        leftImageView.image = LeftImage;
        [self addSubview:leftImageView];
        self.leftImageView = leftImageView;
        
        CGFloat rightX = self.width - leftX  - leftW;
        UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(rightX, leftY, leftW, leftW)];
        rightImageView.image = RightImage;
        [self addSubview:rightImageView];
        self.rightImageView = rightImageView;
        
        CGFloat subIVW = 20;
        CGFloat subIVX = (centerX - leftX - leftW - subIVW) * 0.5 + CGRectGetMaxX(leftImageView.frame);
        CGFloat subIVy = (self.height - subIVW ) * 0.5;
        UIImageView *subLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(subIVX, subIVy, subIVW, subIVW)];
        subLeftImageView.image = SubLeftImage;
        [self addSubview:subLeftImageView];
        self.subLeftImageView = subLeftImageView;
        
        CGFloat subRightIVX = (rightImageView.x - CGRectGetMaxX(centeImageView.frame) - subIVW) * 0.5 + CGRectGetMaxX(centeImageView.frame);
        UIImageView *subRightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(subRightIVX, subIVy, subIVW, subIVW)];
        subRightImageView.image = SubRightImage;
        [self addSubview:subRightImageView];
        self.subRightImageView = subRightImageView;
    }
    return self;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    if (CGRectContainsPoint(self.centeImageView.frame, point)) {
        [self setImageWithIsHidden:YES];
        isStrat = YES;
    } else {
        isStrat = NO;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!isStrat) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.centeImageView.centerX = point.x;
    
    if (self.centeImageView) {
        if ([self frame1:self.leftImageView.frame frame2:self.centeImageView.frame]) {
            [self.leftImageView setImage:LeftImageS];
            self.centeImageView.alpha = 0;
            
        } else if ([self frame1:self.rightImageView.frame frame2:self.centeImageView.frame]) {
            [self.rightImageView setImage:RightImageS];
            self.centeImageView.alpha = 0;
            
        } else {
            [self.leftImageView setImage:LeftImageH];
            [self.rightImageView setImage:RightImageH];
            self.centeImageView.alpha = 1;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!isStrat) {
        return;
    }
    
    if (self.centeImageView) {
        self.centeImageView.alpha = 1;
        if ([self frame1:self.leftImageView.frame frame2:self.centeImageView.frame]) {
            [self.leftImageView setImage:LeftImageS];
            [self moveToImageViewIsLeft:YES];
            
        } else if ([self frame1:self.rightImageView.frame frame2:self.centeImageView.frame]) {
            [self.rightImageView setImage:RightImageS];
            [self moveToImageViewIsLeft:NO];
            
        } else {
            [self setImageWithIsHidden:NO];
        }
    }
}


- (void)moveToImageViewIsLeft:(BOOL)isLeft {
    
    if ([self.delegate respondsToSelector:@selector(selecet:)]) {
        
        [self.delegate selecet:isLeft];
        
    }
    [self setImageWithIsHidden:NO];
    
    NSLog(@"复位");
}


- (void)setImageWithIsHidden:(BOOL)isHidden {
    if (isHidden == YES) {
        [self.centeImageView setImage:CenterImageH];
        [self.leftImageView setImage:LeftImageH];
        [self.rightImageView setImage:RightImageH];
        [self.subLeftImageView setHidden:YES];
        [self.subRightImageView setHidden:YES];
    } else {
        self.centeImageView.frame = self.centerFrame;
        [self.centeImageView setImage:CenterImage];
        [self.leftImageView setImage:LeftImage];
        [self.rightImageView setImage:RightImage];
        [self.subLeftImageView setHidden:NO];
        [self.subRightImageView setHidden:NO];
    }
}


- (BOOL)frame1:(CGRect)rect1 frame2:(CGRect)rect2 {
    CGFloat rangeX = rect1.origin.x - rect1.size.width;
    CGFloat rangeW = rect1.origin.x + rect1.size.width;
    if (rect2.origin.x > rangeX && rect2.origin.x < rangeW ) {
        return YES;
    } else
        return NO;
}


@end
