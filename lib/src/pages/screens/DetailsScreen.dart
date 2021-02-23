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
  @override
  void initState() {
    super.initState();
    creatorBloc.getCreatorsBySerie(widget.id);
  }

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
      body: StreamBuilder<List<Creator>>(
              stream: creatorBloc.seriesStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _CreatorsAdapter(
                    id: widget.id,
                    list: snapshot.data,
                  );
                } else {
                  return circularProgressIndicator();
                }
              }),
    );
  }
}

class _CreatorsAdapter extends StatefulWidget {
  final String id;
  final List<Creator> list;

  const _CreatorsAdapter({@required this.id, @required this.list});

  @override
  _CreatorsAdapterState createState() => _CreatorsAdapterState();
}

class _CreatorsAdapterState extends State<_CreatorsAdapter> {
  List<Creator> listOfCreators = [];

  @override
  void initState() {
    super.initState();
    listOfCreators = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => refreshlist(),
        child: ListView.builder(
          itemCount: listOfCreators.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      getImagePath(listOfCreators[index].thumbnail)),
                ),
                title: Text(listOfCreators[index].fullName),
              ),
            ),
          ),
        ));
  }

  Future<Null> refreshlist() async {
    await creatorBloc.getCreatorsBySerie(widget.id);
    listOfCreators = await creatorBloc.seriesStream.first;
    setState(() {});
    return null;
  }
}
