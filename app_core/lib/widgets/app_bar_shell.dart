import 'package:flutter/material.dart';
import 'package:app_core/themes/colors.dart';

class AppBarShell extends StatelessWidget implements PreferredSizeWidget {
  const AppBarShell({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false, // Alinea el título a la izquierda
      titleSpacing: 16.0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: const Color(0xFFE5E7EB), // Un gris muy tenue (tipo Divider)
          height: 1.0,
        ),
      ), // Margen lateral consistente
      title: Row(
        children: [
          Image.asset(
            'assets/img/logo.png',
            height: 40, // Altura controlada para que no toque los bordes
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12), // Espacio entre el isotipo y el texto
          Text(
            title,
            style: TextStyle(
              color: AppColors.azulCNE, // Usando tu clase de colores
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.help_outline_rounded,
            color: AppColors.azulCNE,
            size: 28,
          ),
          onPressed: () {
            // Lógica de ayuda
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
