
import 'package:Sanaa/features/auth/controllers/auth_controller.dart';
import 'package:Sanaa/features/auth/domain/models/user_short_data_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:Sanaa/data/api/api_client.dart';
import 'package:Sanaa/util/app_constants.dart';

class AddMoneyRepo {
  final ApiClient apiClient;
  AddMoneyRepo({required this.apiClient});
  
  Future<Response>  addMoneyApi({required double amount, required String paymentMethod}) async {
    UserShortDataModel? userData = Get.find<AuthController>().getUserData();
    String? phoneNumber = userData!.phone;
    
    Map<String, Object> body = {
      'amount': '$amount',
      'payment_method': '$phoneNumber',
    };
    return await apiClient.postData(AppConstants.customerPesapalAddMoney,body);
  }
}