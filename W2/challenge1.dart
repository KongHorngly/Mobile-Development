class Point {
  int x;
  int y;

  // use this for require value of x and y
  Point(this.x, this.y);

  void translate(int deltaX, int deltaY) {
    x += deltaX;
    y += deltaY;
  }

  String toString() {
    return "x=$x - y =$y";
  }
}

void main() {
  Point dx = Point(4, 5);
  print(dx);

  Point dy = Point(5, 6);
  print(dy);
}
