import 'package:flutter/material.dart';
import 'package:marvel_app/src/blocs/CreatorBloc.dart';
import 'package:marvel_app/src/models/Creator.dart';

import '../../ui/utils.dart';

class DetailsScreen extends StatefulWidget {
  final String id;

  const DetailsScreen(this.id);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Creator> listOfCreators = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        title: Container(
            width: 130,
            child: Image.asset('assets/images/transparent_logo.png')),
      ),
      body: FutureBuilder(
        future: refreshlist(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
                onRefresh: () => refreshlist(widget.id),
                child: ListView.builder(
                    itemCount: listOfCreators.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text('Hola'),
                        )));
          } else {
            return circularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<List<Creator>> refreshlist(String id) async {
    setState(() {});
    return null;
  }
}
