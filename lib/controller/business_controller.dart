import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/business_model.dart';

class BusinessController extends GetxController {
  RxList<Business> businessList = <Business>[].obs;
  static String? url = dotenv.env['businessNews'];
  @override
  void onInit() {
    super.onInit();
    getInfo().then((value) {
      businessList = value.obs;
    });
  }

  static Future<List<Business>> getInfo() async {
    try {
      // 서버와 통신이 될 때까지 기다려야 하므로 await키워드를 붙여준다.
      final response = await http.get(Uri.parse(url!));
      // statusCode가 200일 경우 json data를 parsing
      if (response.statusCode == 200) {
        // User타입 List에 user라는 변수를 만들고, userFromJson의 response.body를 불러와
        // parsing을 끝낸다.
        print(response.statusCode);
        Business business = businessFromJson(response.body);
        List<Business> businessList = [business];
        print(businessList.length);
        return businessList;
      } else {
        print('error');
        return <Business>[];
      }
    } catch (e) {
      print(e);
      return <Business>[];
    }
  }
}
