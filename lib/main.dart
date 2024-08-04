import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //* Multiprovider nos permite definir varios providers que nosotros podemos consumir
    return MultiProvider(
      //* Se coloca el _ dentro de la función para indicar que no necesitamos el parámetro que vaya en esa sección, por defecto ahi va el context
      //* Con esto se crea el chatProvider de manera global en la aplicación
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: const MaterialApp(
          title: 'Yes No App',
          debugShowCheckedModeBanner: false,
          home: ChatScreen()),
    );
  }
}
