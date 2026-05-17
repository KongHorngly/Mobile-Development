class ImmutablePoint {
  final int _x;
  final int _y;

  // use this for require value of x and y and the only
  const ImmutablePoint(this._x, this._y);

  String toString() {
    return "x=$_x - y =$_y";
  }
}

void main() {
  const ImmutablePoint d1 = ImmutablePoint(4, 5);
  print(d1);


}
