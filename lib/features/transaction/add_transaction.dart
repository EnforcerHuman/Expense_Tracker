import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/features/transaction/drop_down_to_filter.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 260,
                height: 55,
                child: TextFormField(
                  // Search transactions by purpose
                  onChanged: (value) {
                    // Call state management logic to filter transactions
                  },
                  style: const TextStyle(color: Colors.green),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Icon(Icons.search),
                    ),
                    prefixIconColor: const Color.fromARGB(255, 120, 120, 120),
                    hintText: 'search by purpose',
                    hintStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 139, 139, 139),
                      fontSize: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
              const DropDownToFilter(),
            ],
          ),
          Container(height: 0),
          Container(
            margin: const EdgeInsets.all(15),
            height: 620, // Adjust height based on your design
            decoration: BoxDecoration(
              color: const Color.fromARGB(44, 158, 158, 158),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'No Transaction data !!!',
                style: GoogleFonts.poppins(
                  color: Colors.white38,
                  fontSize: 18,
                ),
              ),
            ),
            // Replace the below comment with state management logic
          ),
        ],
      ),
    );
  }
}

// Example custom widget that could be used for individual transaction items
class TransactionItem extends StatelessWidget {
  final transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(transaction.id!),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Call state management logic to delete the transaction
            },
            icon: Icons.delete,
            label: 'delete',
            backgroundColor: Colors.black,
            foregroundColor: const Color.fromARGB(255, 187, 22, 10),
          ),
          SlidableAction(
            onPressed: (context) {
              // Call state management logic to edit the transaction
            },
            icon: Icons.edit,
            label: 'edit',
            backgroundColor: Colors.black,
            foregroundColor: Colors.grey,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.black,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              transaction.date, // Example date
              textAlign: TextAlign.center,
            ),
          ),
          title: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  Icon(
                    // transaction.type == CategoryType.income
                    //     ? Icons.arrow_upward

                    //     :
                    Icons.arrow_downward,
                    color:
                        //  transaction.type == CategoryType.income
                        //     ? Colors.green
                        //     :
                        Colors.red,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      transaction.purpose,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
          trailing: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'RS: ',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                TextSpan(
                  text: transaction.amount.toString(),
                  style: GoogleFonts.poppins(
                    color:
                        //  transaction.type == CategoryType.income
                        //     ?
                        Colors.green,
                    // : Colors.red,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
