import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  
   const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context,) {
    return AlertDialog(
      title: const Text('Изменения не сохранены'),
      content: const Text('Вы уверены что хотите выйти?'),
      actions: <Widget>[
        TextButton(onPressed: (){
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }, child: const Text('Выйти')),
        TextButton(onPressed: (){
          
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          
        }, child: const Text('')),
        TextButton(onPressed: (){
          Navigator.pop(context, true);
        }, child: const Text('Остаться')),
      ],
    );
  }
}