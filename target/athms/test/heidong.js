(function() {

  var c = document.getElementById('the-canvas').getContext("2d");

  var COUNT = 300;
  var WIDTH = 500;
  var HEIGHT = 500;
  var MIN_SIZE = 5;
  var MAX_SIZE = 15;

  var RADIUS = WIDTH * 0.6;
  var SPEED = RADIUS * Math.PI / 4000;

  var points = [];
  for(var i = 0; i < COUNT; i++) {
    points.push({
      size: MIN_SIZE + Math.random() * (MAX_SIZE - MIN_SIZE),
      color: randomColor(),
      theta: Math.random() * Math.PI * 2,
      radius: RADIUS * (Math.random() * 0.5 + 0.1),
      speed: SPEED * (Math.random() * 0.6 + 0.2)
    })
  }

  var startTime = Date.now();
  var last = startTime;

  animate();

  function animate() {
    var now = Date.now();
    var step = now - last;

    c.clearRect(0, 0, WIDTH, HEIGHT);

    points.forEach(function(p) {

      var theta = p.theta;
      var radius = p.radius;
      var speed = p.speed;

      var dTheta = speed * step / radius;
      var dRadius = (8000 / (radius * radius) - speed * speed) * step / 10;
      var dSpeed = Math.sqrt(dRadius) / 500;

      p.theta += dTheta;
      p.radius -= dRadius;
      p.speed += dSpeed;

      if (p.radius >= 0) {
        var x = Math.cos(p.theta) * p.radius;
        var y = Math.sin(p.theta) * p.radius;
        var opacity = Math.max(0, Math.min(1, p.radius * 5 / WIDTH));
        draw(x, y, p.size, p.color, opacity);
      }


    });

    last = now;

    requestAnimationFrame(animate);
  }


  function draw(x, y, size, color, opacity) {
    c.beginPath();
    c.globalAlpha = opacity;
    c.fillStyle = color;
    c.arc(WIDTH / 2 + x, HEIGHT / 2 + y, size, 0, Math.PI * 2, false);
    c.fill();
  }

  function randomColor() {
    const values = _.values(FLATUI_COLORS);
    return values[Math.floor(Math.random() * values.length)]
  }

})();
