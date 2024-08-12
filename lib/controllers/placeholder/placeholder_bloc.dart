import 'package:rxdart/rxdart.dart';
import 'package:shopliax/model/placeholder_model.dart';

class PlaceholderBloc {
  final BehaviorSubject<List<PlaceHolderModel>> _placeHolderList =
      BehaviorSubject<List<PlaceHolderModel>>.seeded([]);

  addPlaceHolderList(List<PlaceHolderModel>? e) =>
      _placeHolderList.sink.add(e!);
  Stream<List<PlaceHolderModel>> get placeHolderListStream =>
      _placeHolderList.stream;



  final BehaviorSubject<bool> _placeHolderListFromInternet =
      BehaviorSubject<bool>.seeded(false);

  addPlaceHolderInternetStatus(bool? e) =>
      _placeHolderListFromInternet.sink.add(e!);
  Stream<bool> get placeHolderBoolStream =>
      _placeHolderListFromInternet.stream;



}
