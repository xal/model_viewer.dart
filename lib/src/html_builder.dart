/* This is free and unencumbered software released into the public domain. */

import 'dart:convert' show htmlEscape;

import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

abstract class HTMLBuilder {
  HTMLBuilder._();

  static String build(
      {final String htmlTemplate = '',
      required final String src,
      final Color backgroundColor = const Color(0xFFFFFF),
      final String? alt,
      final bool ar = false,
      final List<String>? arModes,
      final String? arScale,
      final bool autoRotate = false,
      final int autoRotateDelay = 5,
      final bool autoPlay = false,
      final bool cameraControls = true,
      final String? iosSrc}) {
    final html = StringBuffer(htmlTemplate);
    html.write('<model-viewer');
    html.write(' src="${_htmlEscapeConvert(src)}"');
    html.write(
        ' style="width:100%; height:100%; background-color: rgb(${backgroundColor.red}, ${backgroundColor.green}, ${backgroundColor.blue});"');
    if (alt != null) {
      html.write(' alt="${_htmlEscapeConvert(alt)}"');
    }
    // TODO: animation-name
    // TODO: animation-crossfade-duration
    if (ar) {
      html.write(' ar');
    }
    if (arModes != null) {
      html.write(' ar-modes="${_htmlEscapeConvert(arModes.join(' '))}"');
    }
    if (arScale != null) {
      html.write(' ar-scale="${_htmlEscapeConvert(arScale)}"');
    }
    if (autoRotate) {
      html.write(' auto-rotate');
    }
    if (autoRotateDelay != null) {
      html.write(' auto-rotate-delay="$autoRotateDelay"');
    }
    if (autoPlay) {
      html.write(' autoplay');
    }
    // TODO: skybox-image
    if (cameraControls) {
      html.write(' camera-controls');
    }
    // TODO: camera-orbit
    // TODO: camera-target
    // TODO: environment-image
    // TODO: exposure
    // TODO: field-of-view
    // TODO: interaction-policy
    // TODO: interaction-prompt
    // TODO: interaction-prompt-style
    // TODO: interaction-prompt-threshold
    if (iosSrc != null) {
      html.write(' ios-src="${_htmlEscapeConvert(iosSrc)}"');
    }
    // TODO: max-camera-orbit
    // TODO: max-field-of-view
    // TODO: min-camera-orbit
    // TODO: min-field-of-view
    // TODO: poster
    // TODO: loading
    // TODO: quick-look-browsers
    // TODO: reveal
    // TODO: shadow-intensity
    // TODO: shadow-softness
    html.writeln('></model-viewer>');
    return html.toString();
  }

  static String _htmlEscapeConvert(String src) {
    if (UniversalPlatform.isWeb) {
      return src;
    } else {
      return htmlEscape.convert(src);
    }
  }
}
