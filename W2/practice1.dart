
class Employee {
 String name;
 double _baseSalary;

  Employee(this.name, this._baseSalary);

  void printDetails() {
    print('Employee: $name, Base Salary: \$${_baseSalary}');
  }
}

void main() {
  var emp1 = Employee('Horngly', 400);
  emp1.printDetails();

  var emp2 = Employee('sophy', 450);
  emp2.printDetails();
}
