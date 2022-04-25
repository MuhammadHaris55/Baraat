import 'package:barat/Models/hall_owner_model.dart';
import 'package:barat/services/locationservices.dart';
import 'package:flutter/material.dart';

class OrderConfirmList extends StatefulWidget {
  const OrderConfirmList({Key? key}) : super(key: key);

  @override
  State<OrderConfirmList> createState() => _OrderConfirmListState();
}

class _OrderConfirmListState extends State<OrderConfirmList> {
  LocationServices locationServices = LocationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocationServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: locationServices.getHallOwner(),
                builder: (context, AsyncSnapshot<HallOwnerModel?> snapshot) {
                  if (snapshot.hasData != null) {
                    return ListView.builder(
                        itemCount: snapshot.data?.data?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: Icon(Icons.list),
                              trailing: Text(
                                "${snapshot.data?.data?[index].userEmail}",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              ),
                              title: Text("List item $index"));
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
