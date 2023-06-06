enum ValidRoles{
  admin('admin'),
  employee('employee'),
  cashier('cashier'),
  manager('manager'),
  user('user');

  final String role;
  const ValidRoles(this.role);
}
