import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerController =
    ChangeNotifierProvider((ref) => RegisterController());

class RegisterController extends ChangeNotifier {
   TextEditingController name = TextEditingController();
   TextEditingController phoneNumber = TextEditingController();
   TextEditingController password = TextEditingController();
   TextEditingController confirmPassword = TextEditingController();
   TextEditingController stir = TextEditingController();
   TextEditingController marketName = TextEditingController();
   TextEditingController loginNumber = TextEditingController();
   TextEditingController logenPasword = TextEditingController();
   TextEditingController otpController = TextEditingController();

}
