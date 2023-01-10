class Employee {
  String? email;
  String? firstName;
  String? lastname;
  String? nic;
  String? password;

  Employee(this.email, this.firstName, this.lastname, this.nic, this.password);

  Employee.fromMap(dynamic obj) {
    this.email = obj['email'];
    this.firstName = obj['firstName'];
    this.lastname = obj['lastname'];
    this.nic = obj['nic'];
    this.password = obj['password'];
  }

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastname': lastname,
      'nic': nic,
      'password': password,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Employee{email:$email ,firstName: $firstName, lastname: $lastname, nic: $nic,password:$password}';
  }
}
