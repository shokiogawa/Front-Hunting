import 'package:demo_flutter_project/di.dart';
import 'package:demo_flutter_project/models/entity/company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputCompanyPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: '');
    final detailController = useTextEditingController(text: '');
    final state = ref.watch(companyProvider);
    final viewModel = ref.read(companyProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                isExpanded: true,
                hint: Text(
                  "会社の選考状況を入力",
                  style: TextStyle(color: Colors.black),
                ),
                value: state.companyStatusJp,
                onChanged: (CompanyStatusJp? newStatus) {
                  viewModel.changeStatus(newStatus!);
                },
                items: statusList.map((status) {
                  return DropdownMenuItem(
                      value: status, child: Text(status.statusJp));
                }).toList()),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              onChanged: (name){
                viewModel.changeName(name);
              },
              controller: nameController,
              decoration: InputDecoration(
                hintText: '会社名',
                prefixIcon: Icon(Icons.people_outline),
                suffixIcon: IconButton(
                    onPressed: (){
                      nameController.clear();
                      viewModel.changeName("");
                    },
                    icon: Icon(Icons.close)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,top: 30),
            child: Align(
                alignment: Alignment.topLeft,child: Text("メモ")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              maxLines: 5,
              controller: detailController,
              decoration: InputDecoration(
                // hintText: '詳細',
                suffixIcon: IconButton(
                    onPressed: () => detailController.clear(),
                    icon: Icon(Icons.close)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
          ),
          SizedBox(height: 35),
          SizedBox(
            width: 250,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.withOpacity(0.7),
                    onPrimary: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: state.name == ""
                    ? null
                    : () async {
                        await viewModel
                            .makeCompany(
                                nameController.text,
                                detailController.text,
                                state.companyStatusJp.companyStatus)
                            .then((value) {
                          nameController.clear();
                          detailController.clear();
                          openDialog(context);
                        }).catchError((error) {
                          print(error);
                        });
                      },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "会社を登録する。",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                )),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text("会社を登録しました。"),
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("CLOSE"))
            ],
          );
        });
  }
}
