import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'), 
      action: SnackBarAction(label: 'OK', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) =>  AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Sit dolore proident amet in nisi eu anim proident aliquip pariatur. Nostrud Lorem do magna incididunt ex et nisi tempor pariatur deserunt do. Ex eu esse Lorem aliqua nostrud sit incididunt ut ea.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
          ),

          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Eu excepteur nulla enim fugiat voluptate. Anim exercitation excepteur mollit ad dolor eiusmod exercitation voluptate. Voluptate irure labore ipsum tempor commodo do ullamco nisi sint ut cillum. Dolore dolore aliqua Lorem sit commodo dolor adipisicing non ad veniam deserunt. Tempor adipisicing eu excepteur incididunt.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar dialogo de pantalla')
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context), 
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}