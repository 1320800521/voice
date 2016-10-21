//
//  voice.h
//  voiceDemo
//
//  Created by 🐷 on 16/10/21.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Voice : NSObject
/*
  声音转对象
*/
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;

/*
 文字转语音 string：输入文字   language：语言
 */
- (void)voiceWithString:(NSString *)string language:(NSString *)language;

/*
 停止转
 */

- (void)pase;

/* 继续转*/
- (void)play;


@end
