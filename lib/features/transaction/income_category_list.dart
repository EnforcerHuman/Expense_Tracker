import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        height: 530,
        decoration: BoxDecoration(
            color: const Color.fromARGB(44, 158, 158, 158),
            borderRadius: BorderRadius.circular(30)),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              // final category = newList[index];
              return Container(
                margin: const EdgeInsets.all(5),
                child: Slidable(
                  key: Key('1'),
                  startActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) {
                        // CategoryDB.instance.deleteCategory(category.id);
                      },
                      icon: Icons.delete,
                      label: 'delete',
                      backgroundColor: Colors.black,
                    ),
                  ]),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.black,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
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
                                Text(
                                  'category.name',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w200),
                                ),
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
            }));
  }
}
