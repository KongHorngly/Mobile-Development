class Person {
  String First_name = "";
  String Last_name = "";

//Combine to one string
  String toString() {
    return "The full name = $First_name $Last_name";
  }

//use for require first&last name
  Person(this.First_name, this.Last_name);
}

void main() {
  Person p1 = Person("Kong", "Horngly");
  print(p1);
}
