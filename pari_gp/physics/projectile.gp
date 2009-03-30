\\ 포물선 운동
read("../unittest")

G = 9.8
radian(degree) = polinterpolate([30, 60], [Pi/6, Pi/3], degree)

proVectorAt(v0,r,t) = { \\ t초 후의 속도
  local(vx, vy);
  vx = v0 * cos(r);
  vy = v0 * sin(r) - G * t;
  sqrt(vx ^ 2 + vy ^ 2)
}

proPositionAt(v0,r,t) = { \\ t초 후의 위치
  [v0 * cos(r) * t, v0 * sin(r) * t - ((1/2.0) * G * (t ^ 2))]
}

proHeightTime(v0,r) = { \\ 최고점 도달 시간
  v0 * sin(r) / G
}

\\ 지면 도달 시간 : 최고점 도달시간×2

proHeight(v0,r) = { \\ 최고점 높이
  v0 ^ 2 * sin(2 * r) / 2 * G
}

proRange(v0,r) = { \\ 수평 도달 거리
  v0 ^ 2 * sin(2 * r) / G
}

proRangeMax(v0) = { \\ 최대 사거리
  v0 ^ 2 / G
}


assert_equal(20, proPositionAt(25,radian(45),0.1))

\\#parpos(v,r,t) = 

\\h = (1/2)*g*t^2
\\g = 9.8
\\t = 1
\\assert_equal(20, h)

quit
