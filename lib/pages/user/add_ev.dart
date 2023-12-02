import 'package:ev_charging/ev_model.dart';
import 'package:ev_charging/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNewEv extends StatefulWidget {
  const AddNewEv({Key? key, required this.onAddEv}) : super(key: key);
  final void Function(Ev_model ev_model) onAddEv;

  @override
  State<AddNewEv> createState() => _AddNewEvState();
}

class _AddNewEvState extends State<AddNewEv> {
  final TextEditingController _plateNumberController = TextEditingController();
  final TextEditingController _modelNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _plateNumberController.dispose();
    _modelNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(133, 228, 223, 236),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 52, 18, 16),
        child: Column(
          children: [
            TextField(
              controller: _plateNumberController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: "Vehicle Plate Number",
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _modelNameController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: "Model Name",
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 136, 124, 208),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final userId = FirebaseAuth.instance.currentUser!.uid;
                      Ev_model ev = Ev_model(
                          model_name: _modelNameController.text,
                          plate_number: _plateNumberController.text,
                          userId: userId.toString());

                      print(ev.model_name);
                      print(ev.plate_number);

                      await addEv(ev);
                      Navigator.pop(context);
                    } catch (err) {
                      print('Error while adding ev : ${err}');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 136, 124, 208),
                  ),
                  child: const Text(
                    "Save Vehicle",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
