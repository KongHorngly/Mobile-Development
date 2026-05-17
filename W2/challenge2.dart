
class Point {
  // the xy 2 ponit
  int x;
  int y;
  Point(this.x, this.y);
  String toString() {
    return " x=$x - y=$y";
  }
}

class Rectangle {
  Point topLeft;
  Point bottomRight;

  Rectangle(this.topLeft, this.bottomRight);

  //getter medthod
  int get width => bottomRight.x - topLeft.x;
  int get height => topLeft.y - bottomRight.y;
  int get area => height * width;

  String toString() {
    return " Width = $width, Height = $height, Area = $area";
  }
}

void main() {
  Point p1 = Point(2, 8);
  Point p2 = Point(4, 6);
  Rectangle(p1, p2);
  print(Rectangle(p1, p2));
}
