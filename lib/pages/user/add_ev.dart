import 'package:ev_charging/ev_model.dart';
import 'package:flutter/material.dart';

class addNew_Ev extends StatefulWidget {
  const addNew_Ev({super.key, required this.onaddEv});
  final void Function(Ev_model ev_model) onaddEv;

  @override
  State<addNew_Ev> createState() => _addNew_EvState();
}

class _addNew_EvState extends State<addNew_Ev> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? _selectedDate;

  void _submitExpense() {
    final enteredamount = double.tryParse(_amountcontroller.text);
    final amountIsvalid = enteredamount == null || enteredamount <= 0;
    if (_titlecontroller.text.trim().isEmpty ||
        amountIsvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: ((ctx) => AlertDialog(
              title: const Text("Invalid Input"),
              content: const Text(
                  "Please make sure that title, category, amount and date is valid..!!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("Okay"),
                )
              ],
            )),
      );
      return;
    }
  }

  void _presentDatePicker() async {
    final _now = DateTime.now();
    final _firstDate = DateTime(_now.year - 1, _now.month, _now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: _now,
        firstDate: _firstDate,
        lastDate: _now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(133, 228, 223, 236)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 52, 18, 16),
        child: Column(
          children: [
            const TextField(
              // controller: _titlecontroller,
              maxLength: 50,
              decoration: InputDecoration(
                label: Text("Vehicle Plate Number"),
              ),
            ),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    // controller: _amountcontroller,
                    maxLength: 20,
                    decoration: InputDecoration(
                      label: Text("Model Name"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 136, 124, 208)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Clear all",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 136, 124, 208)),
                    child: const Text(
                      "Save Vehicle",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
