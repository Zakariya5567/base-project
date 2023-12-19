class Validation {
  // Name text field validation
  static nameValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter Your Name";
    }
  }

  static addressValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter Your Address";
    }
  }

  // Email text field validation
  static emailValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter Your Email";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.trim())) {
      return "Please enter valid email";
    }

    return null;
  }

  // Phone text field validation
  static phoneValidation(String? value) {
    String pattern = r'^\d{10}$';
    // String pattern = r'^(?:[+0][1-9])?[0-9]{10}$';
    RegExp regExp = RegExp(pattern);

    if (value!.trim().isEmpty) {
      return "Enter Your Phone Number";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Enter Valid Phone Number";
    }
  }

  // Password text field validation
  static passwordValidation(String? value) {
    String pattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.trim().isEmpty) {
      return "Enter Your Password";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Must be at least 8 characters and include 1 uppercase letter, 1 lowercase letter, 1 digit, and 1 special character (! @ # \$ % ^ & *)";
    }
    // else if (value.length < 8) {
    //   return "Password At least 8 Characters";
    // }
  }

  static reEnterPasswordValidation(String? value, String confirmationValue) {
    if (value!.trim().isEmpty) {
      return "Enter Your Password";
    } else if (value.toLowerCase().trim() !=
        confirmationValue.toLowerCase().trim()) {
      return "Password is not matched";
    }
  }

  // Verification Code text field validation
  static verificationCodeValidation(String? value) {
    if (value!.trim().length < 6) {
      return "Please Enter Valid Code";
    } else if (value.trim().length > 6) {
      return "Please Enter Valid Code";
    }
  }

  // Cancel Reason text field validation
  static reasonValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Please enter Reason";
    }
  }
}
