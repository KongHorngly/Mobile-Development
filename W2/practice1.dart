
enum Skill {
  FLUTTER(5000),
  DART(3000),
  OTHER(1000);

  final double salaryBonus;

  const Skill(this.salaryBonus);
}

class Address {
  String street;
  String city;
  String zipcode;
  Address(this.street, this.city, this.zipcode);
}

class Employee {
  String name;
  double _baseSalary;
  List<Skill> skills;
  String address;
  double _yearsOfExperience;

  Employee(
    this.name,
    this._baseSalary,
    this.skills,
    this.address,
    this._yearsOfExperience,
  );

  double calculateSalary() {
    double salary = _baseSalary;

    salary += _yearsOfExperience * 2000;

    for (var skill in skills) {
      salary += skill.salaryBonus;
    }

    return salary;
  }

  String toString() {
    return 'Employee: \nname: $name\naddress: $address\n'
        'baseSalary: \$$_baseSalary\nyearsOfExperience: $_yearsOfExperience year'
        '\nskills: $skills\ntotalSalary: \$${calculateSalary()}';
  }
}

void main() {
  //Address address1 = Address("5","Phnom penh", "12200");

  var emp1 = Employee(
    "Horngly",
    40000,
    [Skill.FLUTTER, Skill.DART],
    "Phnom penh",
    3,
  );
  print(emp1);
}
