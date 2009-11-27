\\ fun.color
\\                           wookay.noh at gmail.com

rgb_to_hsv(RGB) = {
  local(r, g, b, h, s, delta, maxrgb);
  r = RGB[1]; g = RGB[2]; b = RGB[3]; 
  maxrgb = vecmax(RGB);
  delta = maxrgb - vecmin(RGB) + .;
  s = if(maxrgb==0, 0, 255 * delta / maxrgb);
  h = if(s==0, -1,
      if(r==maxrgb, (g - b) / delta,
      if(g==maxrgb, 2 + (b - r) / delta,
      if(b==maxrgb, 4 + (r - g) / delta,
        0)))) * 60;
  if(h < 0, h += 360, 0);
  [h, s * 100 / 255, maxrgb * 100 / 255]
}

hsv_to_rgb(HSV) = {
  local(h, s, v, rgb, hi, f, p, q, t);
  h = HSV[1] / 360;
  s = HSV[2] / 100;
  v = HSV[3] / 100;
  rgb = if(s < 0.0, [v, v, v],
    hi = floor(h * 6);
    f = h * 6 - hi;
    p = v * (1 - s);
    q = v * (1 - f * s);
    t = v * (1 - (1 - f) * s);
    if(hi==0, [v, t, p],
    if(hi==1, [q, v, p],
    if(hi==2, [p, v, t],
    if(hi==3, [p, q, v],
    if(hi==4, [t, p, v],
      [v, p, q]))))));
  rgb * 255
}

rgb_to_yiq(RGB) = {
  \\yiq = [0.299, 0.587, 0.114; 0.596, -0.275, -0.321; 0.212, -0.523, 0.311] * (RGB/255)~ * 100;
  \\print(88.6-yiq[1]);
  \\[yiq[1], yiq[2], if(yiq[3]<0, 0, yiq[3])]
  \\apply(x -> abs(x), [0.299, 0.587, 0.114; 0.596, -0.275, -0.321; 0.212, -0.523, 0.311] * (RGB/255)~ * 100)
  r = RGB[1]/255;
  g = RGB[2]/255;
  b = RGB[3]/255;
  y = (r * 0.299) + (g *  0.587) + (b *  0.114) + .;
    i = (r * 0.596) + (g * -0.275) + (b * -0.321) + .;
   q = (r * 0.212) + (g * -0.523) + (b * 0.311);
  [y,i,if(q<0,0.0,q)]
    \\Color::YIQ.from_fraction(y, i, q)
}

yiq_to_rgb(YIQ) = {
  YIQ * [1.0, 0.956, 0.621; 1.0, -0.272, -0.647; 1.0, -1.105, 1.702]
}

rgb_to_yuv(RGB) = {
  RGB * [0.299, 0.587, 0.114; -0.147, -0.289, 0.437; 0.615, -0.515, -0.100]
}

yuv_to_rgb(YUV) = {
  YUV * [1.0, 0.0, 1.140; 1.0, -0.394, -0.581; 1.0, 2.028, 0.0]
} 
