String? textInputValidator(String? value) {
  if (value == null) {
    return "Cannot be empty!";
  } else if (value.isEmpty) {
    return "Cannot be empty!";
  } else if (value.contains(" ") &&
      !value.contains(RegExp(r'[A-Z]|[a-z]|[1-9]'))) {
    return "Cannot be empty!";
  }
  return null;
}

String? selectInputValidator(String? value) {
  if (value == null) {
    return "Cannot be empty!";
  } else if (value.isEmpty) {
    return "Cannot be empty!";
  }
  return null;
}
