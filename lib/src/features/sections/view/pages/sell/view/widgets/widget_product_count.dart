import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/controller/sell_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WProductCount extends ConsumerWidget {
  final int index;

  const WProductCount({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sellController);
    var ctr = ref.watch(sellController);
    return Card(
      elevation: 2,
      shadowColor: AppColorss.c_9745FF,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              ctr.kamayuvchi(
                index,
              );
            },
            icon: Icon(
              ctr.count[index] != 0 ? Icons.remove : Icons.delete,
              color: AppColorss.c_9745FF,
            ),
          ),
          Text(ctr.count.elementAt(index).toString()),
          IconButton(
            onPressed: () {
              ctr.oshuvchi(index);
            },
            icon: const Icon(
              Icons.add,
              color: AppColorss.c_9745FF,
            ),
          ),
        ],
      ),
    );
  }
}
