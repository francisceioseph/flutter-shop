import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;
    final Stream<FirebaseUser> user$ =
        FirebaseAuth.instance.currentUser().asStream();

    return StreamBuilder(
      stream: user$,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          final FirebaseUser user = snapshot.data;

          return Container(
            margin: EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: CachedNetworkImage(
                      imageUrl: user.photoUrl,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(user.displayName, style: textTheme.title),
                  ),
                ),
              ],
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
