import 'package:flutter_application_/features/Home/data/news_model/news_model.dart';

class NewsStastes {}

class NewsInitState extends NewsStastes {}

//NewsByCategory

class NewsByCategoryLoadingState extends NewsStastes {}

class NewsByCategorySuccessState extends NewsStastes {
  final NewsModel model;
  NewsByCategorySuccessState({required this.model});
}

class NewsByCategoryErrorState extends NewsStastes {
  final String error;
  NewsByCategoryErrorState({required this.error});
}
//NewsBysearch
class NewsBySearchLoadingState extends NewsStastes {}

class NewsBySearchSuccessState extends NewsStastes {
  final NewsModel model;
  NewsBySearchSuccessState({required this.model});
}

class NewsBySearchErrorState extends NewsStastes {
  final String error;
  NewsBySearchErrorState({required this.error});
}
 //getByScource
class NewsByScourceLoadingState extends NewsStastes {}

class NewsByScourceSuccessState extends NewsStastes {
  final NewsModel model;
  NewsByScourceSuccessState({required this.model});
}

class NewsByScourceErrorState extends NewsStastes {
  final String error;
  NewsByScourceErrorState({required this.error});
}