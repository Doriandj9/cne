import 'package:cne_domicilios/infrastructure/domicilios_microapp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_apps/infrastructure/posts_microapps.dart';

class AppGridMenuShell extends StatelessWidget {
  const AppGridMenuShell({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, // Permite que ocupe solo el espacio necesario
      physics:
          const NeverScrollableScrollPhysics(), // El scroll lo maneja el SingleChildScrollView padre
      crossAxisCount: 2, // Dos columnas como en la imagen
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildMenuCard(
          context,
          'Domicilios',
          Icons.location_on_rounded,
          DomiciliosMicroapp().path,
        ),
        _buildMenuCard(
          context,
          'Publicaciones',
          Icons.badge_rounded,
          PostsMicroapp().path,
        ),
        _buildMenuCard(
          context,
          'Trámites en Línea',
          Icons.assignment_ind_rounded,
        ),
        _buildMenuCard(context, 'Noticias CNE', Icons.newspaper_rounded),
      ],
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon, [
    String? path,
  ]) {
    return GestureDetector(
      onTap: () {
        if (path != null) {
          context.go(path);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            24,
          ), // Bordes redondeados pronunciados
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04), // Sombra muy sutil
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(
                0xFFFFF9E6,
              ), // Fondo crema para el icono
              child: Icon(
                icon,
                color: Theme.of(
                  context,
                ).colorScheme.primary, // Azul institucional
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF003366), // Azul oscuro
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
