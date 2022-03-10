abstract class NewsStates {}

class NewsIntialState extends NewsStates {}

class ButtomNavState extends NewsStates {}

class NewsBusinessLoodingstate extends NewsStates {}

class NewsGetBusinessScucessstate extends NewsStates {}

class NewsGetBusinessErrorstate extends NewsStates {
  final String error;
  NewsGetBusinessErrorstate(this.error);
}

class NewsSportsLoodingstate extends NewsStates {}

class NewsGetSportsScucessstate extends NewsStates {}

class NewsGetSportsErrorstate extends NewsStates {
  final String error;
  NewsGetSportsErrorstate(this.error);
}

class NewsScinceLoodingstate extends NewsStates {}

class NewsGetScinceScucessstate extends NewsStates {}

class NewsGetScinceErrorstate extends NewsStates {
  final String error;
  NewsGetScinceErrorstate(this.error);
}

class NewsSearchLoodingstate extends NewsStates {}

class NewsGetSearchScucessstate extends NewsStates {}

class NewsGetSearchErrorstate extends NewsStates {
  final String error;
  NewsGetSearchErrorstate(this.error);
}
