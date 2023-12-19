
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // Login controller
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // Variables
  bool? isLoading;
  
  // Clear TextFields
  clearFields() {
    loginEmailController.clear();
    loginPasswordController.clear();
    notifyListeners();
  }

  // Clear Authentication Screen
  clearAuthenticationScreen() {
    clearFields();
    notifyListeners();
  }

  // Set Loading
  setLoading(BuildContext context, bool value) {
    isLoading = value;
    if (value == true) {
      // loaderDialog(context);
    } else {
      Navigator.of(context).pop();
    }
    notifyListeners();
  }
/*=================================================================================
  APIs calling
 ==================================================================================*/

  // Registeration ===================================================
  
}
