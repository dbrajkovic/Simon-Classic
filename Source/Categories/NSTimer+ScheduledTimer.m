//
//  NSTimer+SheduledTimer.m
//  TiMote
//
//  Created by Michael on 8/25/09.
//  Copyright 2009 Michael Sanders.
//

#import "NSTimer+ScheduledTimer.h"

@implementation NSTimer (ScheduledTimer)

- (id)initWithTimeInterval:(NSTimeInterval)interval
                    target:(id)target
                  selector:(SEL)selector
                  userInfo:(id)userInfo
                   repeats:(BOOL)repeats
{
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:interval];
    self = [self initWithFireDate:date
                         interval:interval
                           target:target
                         selector:selector
                         userInfo:userInfo
                          repeats:repeats];
    [date release];
    return self;
}

- (id)initAndScheduleWithTimeInterval:(NSTimeInterval)interval
                               target:(id)target
                             selector:(SEL)selector
                             userInfo:(id)userInfo
                              repeats:(BOOL)repeats
{
    self = [self initWithTimeInterval:interval
                               target:target
                             selector:selector
                             userInfo:userInfo
                              repeats:repeats];

    if (self != nil) {
        [[NSRunLoop currentRunLoop] addTimer:self forMode:NSDefaultRunLoopMode];
    }
    return self;
}

@end
