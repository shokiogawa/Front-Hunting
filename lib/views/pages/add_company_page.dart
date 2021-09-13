import 'package:demo_flutter_project/di.dart';
import 'package:demo_flutter_project/views/components/company_tile_component.dart';
import 'package:demo_flutter_project/views/pages/input_company_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCompanyPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _state = ref.watch(companyProvider);
    final _viewModel = ref.read(companyProvider.notifier);
    final _future = useMemoized(() async => await _viewModel.listCompany());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openModal(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("選考状況"),
      ),
      body: FutureBuilder(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Container();
            } else {
              return ListView.builder(
                itemCount: _state.companyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CompanyTileComponent(
                        company: _state.companyList[index]);
                  });
              // if (_state.companyList.isEmpty) {
              //   return Container();
              // } else {
              //   return ListView.builder(
              //       itemBuilder: (BuildContext context, int index) {
              //     return CompanyTileComponent(
              //         company: _state.companyList[index]);
              //   });
              // }
            }
          }),
    );
  }

  void _openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height - 100,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: InputCompanyPage());
        });
  }
}
