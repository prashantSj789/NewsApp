import 'package:news_app/models/CategoriesNewsModels.dart';
import 'package:news_app/models/News_Headline_Model.dart';
import 'package:news_app/repository/repository.dart';

class NewsView {
  Future<News_Headline_Model> fetchnewsfromapi() async {
    NewsRepository repo = NewsRepository();
    return repo.fecthnews();
  }
  Future<CategoriesNewsModel> fetchcategorynewsfromapi(String category) async {
    NewsRepository repo = NewsRepository();
    return repo.fecthcategoriesnews(category);
  }
  
}