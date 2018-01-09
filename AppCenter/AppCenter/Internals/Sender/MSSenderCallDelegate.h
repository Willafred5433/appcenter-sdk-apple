#import <Foundation/Foundation.h>

@class MSSenderCall;

@protocol MSSenderCallDelegate <NSObject>

/**
 *  Send call.
 *
 *  @param call Call object.
 */
- (void)sendCallAsync:(MSSenderCall *)call;

/**
 *  Call completed callback.
 *
 *  @param call Call object.
 *  @param fatalError Flag indicating a fatal error.
 */
- (void)call:(MSSenderCall *)call completedWithFatalError:(BOOL)fatalError;

@end
