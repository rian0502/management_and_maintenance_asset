import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../connection/api_dropdown.dart';
import '../connection/api_service.dart';
import '../models/maintenance.dart' as maintenance;
import '../models/mechanic.dart' as mechanic;
import '../models/assets.dart' as assets;
import 'package:go_router/go_router.dart';

class EditMaintenanceScreen extends StatefulWidget {
  final maintenance.Data? maintc;
  const EditMaintenanceScreen({Key? key, this.maintc}) : super(key: key);

  @override
  State<EditMaintenanceScreen> createState() => _EditMaintenanceScreenState();
}

class _EditMaintenanceScreenState extends State<EditMaintenanceScreen> {
  String _uuidAset = '';
  String _id = '';
  String _uuidKMechanic = '';
  final TextEditingController _notes = TextEditingController();

  @override
  void initState() {
    _id = widget.maintc!.uuid!;
    _notes.text = widget.maintc!.note!;
    _uuidAset = widget.maintc!.idAsset!;
    _uuidKMechanic = widget.maintc!.idTeknisi!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Maintenance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
              width: 400,
              child: Text('Aset'),
            ),
            DropdownSearch(
              itemAsString: (item) => "${item.namaAsset!} - ${item.serial!}",
              asyncItems: (String? filter) {
                return APIDropDown.getAllAssets();
              },
              onChanged: (value) {
                setState(() {
                  _uuidAset = value!.uuid!;
                });
                print(_uuidAset);
              },
              popupProps: PopupProps.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                itemBuilder:
                    (BuildContext context, assets.Data item, bool isSelected) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Text('${item.namaAsset!} - ${item.serial!}'),
                  );
                },
              ),
              compareFn: (item, sItem) => item.uuid == sItem.uuid,
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 20,
              width: 400,
              child: Text('Mekanik'),
            ),
            DropdownSearch(
              itemAsString: (item) => "${item.namaTeknisi!} - ${item.nik!}",
              asyncItems: (String? filter) {
                return APIDropDown.getAllMechanic();
              },
              onChanged: (value) {
                setState(() {
                  _uuidKMechanic = value!.uuid!;
                });
                print(_uuidKMechanic);
              },
              popupProps: PopupProps.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                itemBuilder: (BuildContext context, mechanic.Data item,
                    bool isSelected) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(item.namaTeknisi!),
                  );
                },
              ),
              compareFn: (item, sItem) => item.uuid == sItem.uuid,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _notes,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Catatan',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (_notes.text.isNotEmpty) {
                        APIService.updateMaintenance(
                                _id, _uuidAset, _uuidKMechanic, _notes.text)
                            .then((value) => {
                                  if (value == 1)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'Berhasil mengubah data'),
                                      )),
                                      context.pop(),
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content:
                                            Text('Gagal mengubah data'),
                                      )),
                                    }
                                });
                      }
                    },
                    child: const Text('Simpan'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
