String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }
  return null;
}

String? validateDepartment(String? value) {
  if (value == null || value.isEmpty) {
    return 'Department is required';
  }
  return null;
}

String? validateAge(String? value) {
  if (value == null || value.isEmpty) {
    return 'Age is required';
  }

  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }

  return null;
}
