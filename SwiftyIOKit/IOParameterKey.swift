//
//  IOParameterKey.swift
//  SwiftyIOKit
//
//  Created by Sergej Jaskiewicz on 22/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

import IOKit.graphics

public struct IOParameterKey {
    
    internal let _rawValue: String
    
    public static let parameters =
        IOParameterKey(_rawValue: kIODisplayParametersKey)
    
    public static let guid =
        IOParameterKey(_rawValue: kIODisplayGUIDKey)
    
    public static let value =
        IOParameterKey(_rawValue: kIODisplayValueKey)
    
    public static let minValue =
        IOParameterKey(_rawValue: kIODisplayMinValueKey)
    
    public static let maxValue =
        IOParameterKey(_rawValue: kIODisplayMaxValueKey)
    
    public static let brightnessProbe =
        IOParameterKey(_rawValue: kIODisplayBrightnessProbeKey)
    
    public static let linearBrightnessProbe =
        IOParameterKey(_rawValue: kIODisplayLinearBrightnessProbeKey)
    
    public static let brightness =
        IOParameterKey(_rawValue: kIODisplayBrightnessKey)
    
    public static let linearBrightness =
        IOParameterKey(_rawValue: kIODisplayLinearBrightnessKey)
    
    public static let usableLinearBrightness =
        IOParameterKey(_rawValue: kIODisplayUsableLinearBrightnessKey)
    
    public static let brightnessFade =
        IOParameterKey(_rawValue: kIODisplayBrightnessFadeKey)
    
    public static let contrast =
        IOParameterKey(_rawValue: kIODisplayContrastKey)
    
    public static let horizontalPosition =
        IOParameterKey(_rawValue: kIODisplayHorizontalPositionKey)
    
    public static let horizontalSize =
        IOParameterKey(_rawValue: kIODisplayHorizontalSizeKey)
    
    public static let verticalPosition =
        IOParameterKey(_rawValue: kIODisplayVerticalPositionKey)
    
    public static let verticalSize =
        IOParameterKey(_rawValue: kIODisplayVerticalSizeKey)
    
    public static let trapezoid =
        IOParameterKey(_rawValue: kIODisplayTrapezoidKey)
    
    public static let pincushion =
        IOParameterKey(_rawValue: kIODisplayPincushionKey)
    
    public static let parallelogram =
        IOParameterKey(_rawValue: kIODisplayParallelogramKey)
    
    public static let rotation =
        IOParameterKey(_rawValue: kIODisplayRotationKey)
    
    public static let theatreMode =
        IOParameterKey(_rawValue: kIODisplayTheatreModeKey)
    
    public static let theatreModeWindow =
        IOParameterKey(_rawValue: kIODisplayTheatreModeWindowKey)
    
    public static let overscan =
        IOParameterKey(_rawValue: kIODisplayOverscanKey)
    
    public static let videoBest =
        IOParameterKey(_rawValue: kIODisplayVideoBestKey)
    
    public static let speakerVolume =
        IOParameterKey(_rawValue: kIODisplaySpeakerVolumeKey)
    
    public static let speakerSelect =
        IOParameterKey(_rawValue: kIODisplaySpeakerSelectKey)
    
    public static let microphoneVolume =
        IOParameterKey(_rawValue: kIODisplayMicrophoneVolumeKey)
    
    public static let ambientLightSensor =
        IOParameterKey(_rawValue: kIODisplayAmbientLightSensorKey)
    
    public static let audioMuteAndScreenBlank =
        IOParameterKey(_rawValue: kIODisplayAudioMuteAndScreenBlankKey)
    
    public static let audioTreble =
        IOParameterKey(_rawValue: kIODisplayAudioTrebleKey)
    
    public static let audioBass =
        IOParameterKey(_rawValue: kIODisplayAudioBassKey)
    
    public static let audioBalanceLr =
        IOParameterKey(_rawValue: kIODisplayAudioBalanceLRKey)
    
    public static let audioProcessorMode =
        IOParameterKey(_rawValue: kIODisplayAudioProcessorModeKey)
    
    public static let powerMode =
        IOParameterKey(_rawValue: kIODisplayPowerModeKey)
    
    public static let manufacturerSpecific =
        IOParameterKey(_rawValue: kIODisplayManufacturerSpecificKey)
    
    public static let powerState =
        IOParameterKey(_rawValue: kIODisplayPowerStateKey)
    
    public static let controllerId =
        IOParameterKey(_rawValue: kIODisplayControllerIDKey)
    
    public static let capabilityString =
        IOParameterKey(_rawValue: kIODisplayCapabilityStringKey)
    
    public static let redGammaScale =
        IOParameterKey(_rawValue: kIODisplayRedGammaScaleKey)
    
    public static let greenGammaScale =
        IOParameterKey(_rawValue: kIODisplayGreenGammaScaleKey)
    
    public static let blueGammaScale =
        IOParameterKey(_rawValue: kIODisplayBlueGammaScaleKey)
    
    public static let gammaScale =
        IOParameterKey(_rawValue: kIODisplayGammaScaleKey)
    
    public static let parametersCommit =
        IOParameterKey(_rawValue: kIODisplayParametersCommitKey)
    
    public static let parametersDefault =
        IOParameterKey(_rawValue: kIODisplayParametersDefaultKey)
    
    public static let parametersFlush =
        IOParameterKey(_rawValue: kIODisplayParametersFlushKey)
}
