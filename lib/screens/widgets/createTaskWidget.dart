import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todolist/Service/routes/router.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: TextButton(onPressed: (){
            // Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            AutoRouter.of(context).pushAndPopUntil(const HomeRoute(), predicate: (route)=> false);
                    }, child: const Text('Выйти')),
          ),
        Padding(
            padding: const EdgeInsets.only(right: 12),
          child: TextButton(onPressed: (){
            // Navigator.pop(context, true);
            AutoRouter.of(context).pop(true);
          }, child: const Text('Остаться')),
        ),
          ],
        )
       
      ],
    );
  }
}