import hxd.Key in K;

class SolarSystem extends hxd.App {

  var timer : Int;
  var o_sun : h2d.Graphics;
  var o_orbit : h2d.Anim;

  override function init() {

    engine.backgroundColor = 0x202020;

    timer = 0;

    o_sun = new h2d.Graphics(s2d);
		o_sun.beginFill(0xFFEE00);
		o_sun.drawCircle(0, 0, 50);
		o_sun.endFill();

    var t_orbit_1 = h2d.Tile.fromColor(0xFF0000, 20, 20);
    var t_orbit_2 = h2d.Tile.fromColor(0x00FF00, 20, 20);
    var t_orbit_3 = h2d.Tile.fromColor(0x0000FF, 20, 20);

    t_orbit_1.dx = 250;
    t_orbit_1.dy = -10;
    t_orbit_2.dx = 250;
    t_orbit_2.dy = -10;
    t_orbit_3.dx = 250;
    t_orbit_3.dy = -10;

    o_sun.x = s2d.width * 0.5;
    o_sun.y = s2d.height * 0.5;
    o_sun.tile.dx = -25;
    o_sun.tile.dy = -25;

    o_orbit = new h2d.Anim([t_orbit_1, t_orbit_2, t_orbit_3],s2d);
    o_orbit.x = s2d.width * 0.5;
    o_orbit.y = s2d.height * 0.5;
    o_orbit.speed = 0;
  }

  override function update(dt : Float) {

    o_orbit.rotation += 0.01;

    if (timer < 500 ) {
      o_sun.scale(1.001);
      timer += 1;
    }

    if (K.isPressed(K.SPACE)) {
      o_orbit.currentFrame = o_orbit.currentFrame + 1;
    }
  }

  static function main() {
    new SolarSystem();
  }
}
