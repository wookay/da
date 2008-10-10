module CoreGraphics
  require 'dl/import'
  extend DL::Importable
  dlload '/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.1.sdk/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics'
  extern "void CGContextRelease(void *)"
  extern "void CGContextMoveToPoint(void *, float, float)"
end

CoreGraphics::cGContextMoveToPoint(nil, 10.0, 10.0)
CoreGraphics::cGContextMoveToPoint(nil, 10.0, 10.0)
