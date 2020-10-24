import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
              height: 250,
              //alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        'https://media-exp1.licdn.com/dms/image/C4E03AQFilx6AuyC21g/profile-displayphoto-shrink_200_200/0?e=1608768000&v=beta&t=1Ml1vbPq6tgtndGlOxVxpBIAhH4bjFrJyIF1MC9Mnns'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Olá Cayo!",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
          DrawerTile(
            iconData: Icons.person,
            title: 'Perfil',
            pageNumber: 0,
          ),
          DrawerTile(
            iconData: Icons.list,
            title: 'Exames',
            pageNumber: 1,
          ),
          DrawerTile(
            iconData: Icons.crop_square,
            title: 'QR',
            pageNumber: 2,
          ),
          DrawerTile(
            iconData: Icons.pages,
            title: 'Consultas',
            pageNumber: 3,
          ),
          DrawerTile(
            iconData: Icons.exit_to_app,
            title: 'Logout',
            pageNumber: 4,
          )
        ],
      ),
    );
  }
}
