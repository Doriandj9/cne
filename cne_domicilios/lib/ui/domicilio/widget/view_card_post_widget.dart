import 'package:flutter/material.dart';

class ViewCardPostWidget extends StatelessWidget {
  const ViewCardPostWidget({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ), // Bordes redondeados de la tarjeta
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sección de texto (Izquierda)
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF003366), // Azul institucional CNE
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  body,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          //const SizedBox(width: 12),
          // Imagen (Derecha)
          // Expanded(
          //   flex: 1,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(
          //       16,
          //     ), // Bordes redondeados de la imagen
          //     child: Image.network(
          //       'https://via.placeholder.com/150', // Reemplaza con tu asset de imagen
          //       height: 80,
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
