import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/core/styles/app_colors.dart';
import 'package:moneymanagementapp/core/styles/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  final String name;
  final Function(BuildContext) onDelete;
  const CategoryCard(
      {super.key,
      required this.index,
      required this.name,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Slidable(
        key: const Key('1'),
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            label: 'delete',
            backgroundColor: AppColors.backgroundColor,
          ),
        ]),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: AppColors.backgroundColor,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.backgroundColor,
                child: Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.center,
                ),
              ),
              title: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      Text(name, style: AppTextStyles.bodyText3),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
