import 'package:flutter/material.dart';
import 'package:shopliax/model/placeholder_model.dart';

class PlaceholderListtile extends StatelessWidget {
  const PlaceholderListtile({
    super.key,
    required this.placeHolderModel,
  });

  final PlaceHolderModel placeHolderModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      color: Colors.white,
      elevation: .25,
      child: ListTile(
          contentPadding: const EdgeInsets.only(left: 18),
          leading: CircleAvatar(
            onBackgroundImageError: (exception, stackTrace) {
              print(exception);
            },
            onForegroundImageError: (exception, stackTrace) {
              print(exception);
            },
            foregroundImage: NetworkImage(placeHolderModel.thumbnailUrl!),
            backgroundImage: NetworkImage(placeHolderModel.thumbnailUrl!),
          ),
          title: Text(
            placeHolderModel.title!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Album ID - ${placeHolderModel.albumId}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          trailing: const Icon(Icons.chevron_right_outlined)),
    );
  }
}
