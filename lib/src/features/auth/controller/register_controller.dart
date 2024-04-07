import 'package:barcodbek/src/core/services/auth/authcread_services.dart';
import 'package:barcodbek/src/data/entity/auth_register_model.dart';
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

  // Future<void> userCreate(AuthRegisterModel data) async {
  //  await AuthCreateServices.POST(data);
  //  notifyListeners();
  // }
}
