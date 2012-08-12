CanvasExtensions =
  circle: (x, y, radius) ->
    @arc x, y, radius, 0, Math.PI * 2, true

  fillCircle: (x, y, radius) ->
    do @beginPath
    @circle x, y, radius
    do @closePath
    do @fill

  strokeCircle: (x, y, radius) ->
    do @beginPath
    @circle x, y, radius
    do @closePath
    do @stroke

  ellipse: (x, y, width, height) ->
    kappa = .5522848
    ox = (width  / 2) * kappa
    oy = (height / 2) * kappa
    xe = x + width
    ye = y + height
    xm = x + width / 2
    ym = y + height / 2

    @moveTo x, ym
    @bezierCurveTo x, ym - oy, xm - ox, y, xm, y
    @bezierCurveTo xm + ox, y, xe, ym - oy, xe, ym
    @bezierCurveTo xe, ym + oy, xm + ox, ye, xm, ye
    @bezierCurveTo xm - ox, ye, x, ym + oy, x, ym

  fillEllipse: (x, y, width, height) ->
    do @beginPath
    @ellipse x, y, width, height
    do @closePath
    do @fill

  strokeEllipse: (x, y, width, height) ->
    do @beginPath
    @ellipse x, y, width, height
    do @closePath
    do @stroke

if CanvasRenderingContext2D?
  for name, method of CanvasExtensions when not CanvasRenderingContext2D.prototype.hasOwnProperty(name)
    CanvasRenderingContext2D.prototype[name] = method
