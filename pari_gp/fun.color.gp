\\ fun.color
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

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
