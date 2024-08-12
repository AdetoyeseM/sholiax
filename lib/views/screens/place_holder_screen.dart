import 'package:flutter/material.dart';
import 'package:shopliax/controllers/placeholder/placeholder_request.dart';
import 'package:shopliax/model/placeholder_model.dart';
import 'package:shopliax/service_locator.dart';
import 'package:shopliax/views/components/widgets/placeholder_listtile.dart';

class PlaceHolderScreen extends StatelessWidget {
  PlaceHolderScreen({super.key});
  PlaceholderRequest placeholderRequest = PlaceholderRequest();
  @override
  Widget build(BuildContext context) {
    placeholderRequest.fetchPlaceHolders();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PlaceholderAPI List'),
      ),
      body: StreamBuilder<List<PlaceHolderModel>>(
          stream: $placeholderBloc.placeHolderListStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.data!.isEmpty ||
                !snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                StreamBuilder<bool>(
                    stream: $placeholderBloc.placeHolderBoolStream,
                    builder: (context, snapshot) {
                      while (!snapshot.hasData) {
                        return const SizedBox();
                      }
                      return Container(
                        height: 25,
                        color:
                            snapshot.data != true ? Colors.red : Colors.green,
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          snapshot.data != true
                              ? "Fetching from LOCAL"
                              : "Fetching from Internet",
                          style: const TextStyle(color: Colors.white),
                        )),
                      );
                    }),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await placeholderRequest.fetchPlaceHolders();
                    },
                    child: ListView(
                      children: [
                        ...snapshot.data!.map((e) {
                          return PlaceholderListtile(
                            placeHolderModel: e,
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
