import 'package:new_app/models/response_model/news_response_model.dart';
import 'package:new_app/repository/api_provider.dart';

class Repository {
  ApiProvider apiProvider = new ApiProvider();

  // api call for fetching news
  Future<NewsResponseModel?> getNews() async {
    print("check api call ");
    var response;
    try {
      response = await apiProvider.get(
          "https://candidate-test-data-moengage.s3.amazonaws.com/Android/news-api-feed/staticResponse.json");
      return NewsResponseModel.fromJson(response);
      // ignore: unused_catch_stack
    } catch (e, s) {
      throw e;
    }
  }
}
