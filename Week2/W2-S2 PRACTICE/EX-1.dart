enum Skill { FLUTTER, DART, HTML, JAVASCRIPT, CSS }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  // Constructor
  Employee(this._skills, this._address, this._yearsOfExperience);


  factory Employee.mobileDeveloper(Address address, int yearsOfExperience) {
    return Employee(
      [Skill.FLUTTER, Skill.DART],
      address,
      yearsOfExperience,
    );
  }
  factory Employee.webDeveloper(Address address, int yearsOfExperience) {
    return Employee(
      [Skill.HTML, Skill.CSS, Skill.JAVASCRIPT],
      address,
      yearsOfExperience,
    );
  }

  // Getter
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // Method to compute salary
  double computeSalary() {
    double baseSalary = 40000;
    double experienceBonus = _yearsOfExperience * 2000;
    double skillsBonus = 0;

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          skillsBonus += 5000;
          break;
        case Skill.DART:
          skillsBonus += 3000;
          break;
        default:
          skillsBonus += 1000;
          break;
      }
    }

    return baseSalary + experienceBonus + skillsBonus;
  }
}

void main() {
  var address1 = Address("123rrt", "Siem reap", "90909");
  var emp1 = Employee.mobileDeveloper(address1, 5);
  var address2 = Address("2004", "Phnom Penh", "200220");
  var emp2 = Employee.webDeveloper(address2, 1);

  print("Employee Skills: ${emp1.skills}");
  print("Employee Address: ${emp1.address.street}, ${emp1.address.city}");
  print("Years of Experience: ${emp1.yearsOfExperience}");
  print("Salary: \$${emp1.computeSalary()}");


  print("Employee Skills: ${emp2.skills}");
  print("Employee Address: ${emp2.address.street}, ${emp2.address.city}");
  print("Years of Experience: ${emp2.yearsOfExperience}");
  print("Salary: \$${emp2.computeSalary()}");
}
