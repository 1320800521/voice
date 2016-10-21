//
//  voice.m
//  voiceDemo
//
//  Created by 🐷 on 16/10/21.
//
//

#import "Voice.h"

static Voice *myVoice = Nil;

@implementation Voice

+ (id)allocWithZone:(struct _NSZone *)zone{
   
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        if (myVoice == Nil) {
             myVoice = [super allocWithZone:zone];
            myVoice.synthesizer = [[AVSpeechSynthesizer alloc]init];
        }
    
    });
    
    return myVoice;
}

+ (Voice *)defaultUser{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        if (myVoice == Nil) {
            myVoice = [[self alloc]init];
            myVoice.synthesizer = [[AVSpeechSynthesizer alloc]init];
        }
        
    });
    return myVoice;
}

/*
    文字转语音 string：输入文字   language：语言
 */
- (void)voiceWithString:(NSString *)string language:(NSString *)language{
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:string];
//    AVSpeechSynthesisVoice *voiceType = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN, zh-HK, zh-TW"];
     AVSpeechSynthesisVoice *voiceType = [AVSpeechSynthesisVoice voiceWithLanguage:language];
    utterance.voice = voiceType;
    //设置语速
    utterance.rate *= 0.9;
    //设置音量
    utterance.volume = 0.6;
    
    [myVoice.synthesizer speakUtterance:utterance];
}

/*
    停止转
 */

- (void)pase{
    if (![myVoice.synthesizer isPaused]) {
        [myVoice.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}

/* 继续转*/
- (void)play{
    if ([myVoice.synthesizer isPaused]) {
        [myVoice.synthesizer continueSpeaking];
    }
}

- (id)copyWithZone:(NSZone *)zone
{
    return myVoice;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return myVoice;
}

@end
