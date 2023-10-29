import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({
    super.key,
    required this.uid,
  });

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((userDb) => setState(
          () {
            this.user = userDb;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('User View', style: CustomLabels.h1),
          SizedBox(height: 10),
          if (user == null)
            WhiteCard(
              child: Container(
                alignment: Alignment.center,
                height: 400,
                child: CircularProgressIndicator(),
              ),
            ),
          _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Table(
      columnWidths: {0: FixedColumnWidth(250)},
      children: [
        TableRow(children: [
          _AvatarContainer(),
          Container(
            color: Colors.green,
            height: 200,
          )
        ])
      ],
    ));
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: CustomLabels.h2,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 160,
              child: Stack(
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage('noimage.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Nombre de usario',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
