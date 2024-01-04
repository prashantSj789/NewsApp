import 'dart:convert';

import 'package:news_app/models/CategoriesNewsModels.dart';
import 'package:news_app/models/News_Headline_Model.dart';
import 'package:http/http.dart'as http;
class NewsRepository {

  Future<News_Headline_Model> fecthnews() async
  {
    String url = "https://newsapi.org/v2/everything?q=india&from=2023-12-15&sortBy=popularity&apiKey=ff94210110c54acb95794ed85850f21f";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200)
    { 
      final body = jsonDecode(response.body);
   return News_Headline_Model.fromJson(body);
    }
    else
    {
      throw Exception('failed to load headlines');
    }

  }
  Future<CategoriesNewsModel> fecthcategoriesnews(String category) async
  {
    String url = "https://newsapi.org/v2/everything?q=${category}&from=2023-12-15&sortBy=popularity&apiKey=ff94210110c54acb95794ed85850f21f";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200)
    { 
      final body = jsonDecode(response.body);
   return CategoriesNewsModel.fromJson(body);
    }
    else
    {
      throw Exception('failed to load headlines');
    }

  }
  
}