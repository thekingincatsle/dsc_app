import 'dart:convert';
import 'package:dsc_app/models/event.dart';
import 'package:dsc_app/screens/event_screen/widgets/event_item.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  Future<List<Event>> getEventList() async {
    final response = await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/EVENT_MOCK_DATA.json');
    final data = json.decode(response) as List<dynamic>;
    List<Event> _list = data.map((e) => Event.fromJson(e)).toList();
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
          future: getEventList(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              List<Event> _events = snapshot.data as List<Event>;
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      child: const Text(
                        'Sự kiện',
                        style: TextStyle(
                            fontSize: 36,
                            color: ERROR_COLOR,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (_, index) => EventItem())
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
