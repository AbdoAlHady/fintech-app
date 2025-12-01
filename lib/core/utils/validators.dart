class AppValidators {
  AppValidators._();

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _hasUppercase = RegExp(r'[A-Z]');
  static final RegExp _hasLowercase = RegExp(r'[a-z]');
  static final RegExp _hasDigit = RegExp(r'\d');
  static final RegExp _hasSymbol = RegExp(r'[@$!%*?&]');

  static final RegExp _usernameRegex = RegExp(r'^[a-zA-Z0-9]{3,20}$');
  static final RegExp _phoneRegex = RegExp(r'^\d{10,15}$');
  static final RegExp _onlyLettersRegex = RegExp(r'^[a-zA-Z]+$');
  static final RegExp _onlyNumbersRegex = RegExp(r'^\d+$');
  static final RegExp _lettersAndNumbersRegex = RegExp(r'^[a-zA-Z0-9]+$');
  static final RegExp _noSpacesRegex = RegExp(r'^\S+$');
  static final RegExp _noSpecialCharsRegex = RegExp(r'^[a-zA-Z0-9\s]+$');

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    final email = value.trim();

    if (email.isEmpty) {
      return "Email is required";
    }

    if (!email.contains('@')) {
      return "Email must contain @";
    }

    if (email.indexOf('@') != email.lastIndexOf('@')) {
      return "Email can only contain one @";
    }

    final parts = email.split('@');
    if (parts.length != 2 || parts[0].isEmpty) {
      return "Invalid email format";
    }

    if (parts[1].isEmpty) {
      return "Email must have a domain after @";
    }

    if (!parts[1].contains('.')) {
      return "Email domain must contain a dot";
    }

    final domainParts = parts[1].split('.');
    if (domainParts.any((part) => part.isEmpty)) {
      return "Invalid domain format";
    }

    if (!_emailRegex.hasMatch(email.toLowerCase())) {
      return "Please enter a valid email";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    if (!_hasUppercase.hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    }

    if (!_hasDigit.hasMatch(value)) {
      return "Password must contain at least one number";
    }

    return null;
  }

  static String? validateStrongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (!_hasUppercase.hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    }

    if (!_hasLowercase.hasMatch(value)) {
      return "Password must contain at least one lowercase letter";
    }

    if (!_hasDigit.hasMatch(value)) {
      return "Password must contain at least one number";
    }

    if (!_hasSymbol.hasMatch(value)) {
      return "Password must contain at least one symbol";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    }

    if (!_usernameRegex.hasMatch(value)) {
      return "Username must be 3–20 characters with no spaces or symbols";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    if (!_phoneRegex.hasMatch(value)) {
      return "Please enter a valid phone number";
    }

    return null;
  }

  static String? validateOnlyLetters(String? value) {
    if (value == null || value.isEmpty) {
      return "Input is required";
    }

    if (!_onlyLettersRegex.hasMatch(value)) {
      return "Letters only";
    }

    return null;
  }

  static String? validateOnlyNumbers(String? value) {
    if (value == null || value.isEmpty) {
      return "Input is required";
    }

    if (!_onlyNumbersRegex.hasMatch(value)) {
      return "Numbers only";
    }

    return null;
  }

  static String? validateLettersAndNumbers(String? value) {
    if (value == null || value.isEmpty) {
      return "Input is required";
    }

    if (!_lettersAndNumbersRegex.hasMatch(value)) {
      return "Letters and numbers only";
    }

    return null;
  }

  static String? validateNoSpaces(String? value) {
    if (value == null || value.isEmpty) {
      return "Input is required";
    }

    if (!_noSpacesRegex.hasMatch(value)) {
      return "Spaces are not allowed";
    }

    return null;
  }

  static String? validateNoSpecialCharacters(String? value) {
    if (value == null || value.isEmpty) {
      return "Input is required";
    }

    if (!_noSpecialCharsRegex.hasMatch(value)) {
      return "Special characters are not allowed";
    }

    return null;
  }

  static String? validateGenericText(String? value) {
    if (value == null || value.isEmpty) {
      return "Input is required";
    }

    if (value != value.trim()) {
      return "Leading or trailing spaces are not allowed";
    }

    return null;
  }
}
