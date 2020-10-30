import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/models/user/user_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class InfoHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/house.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Consumer<UserManager>(
          builder: (_, userManager, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Bem-vindo!',
                  style: TextStyle(
                    color: ColorsApp.secondaryColor(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userManager.user?.name ?? 'Visitante',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    if (userManager.isLoggedIn) {
                      userManager.signOut();
                    } else {
                      Navigator.of(context).pushNamed('/login');
                    }
                  },
                  child: Text(
                    userManager.isLoggedIn
                        ? 'Encerrar Sessão'
                        : 'Entre ou cadastre-se',
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
