//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class SchedulingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine Scheduler',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'ubuntu',
      ),
      home: Calendar(title: 'Medicine Scheduler'),
    );
  }
}

class Calendar extends StatefulWidget {
  Calendar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  Dialog dialog = new Dialog();

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.add(Duration(days: 1)): ['Vitamin C  18:30', 'Ibuprofen  09:30'],
      _selectedDay.add(Duration(days: 2)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 3)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 5)): ['Vitamin C  18:30', 'Ramipril  20:00'],
      _selectedDay.add(Duration(days: 6)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 7)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 8)): ['Vitamin C  18:30', 'Ibuprofen  09:30'],
      _selectedDay.add(Duration(days: 9)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 10)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 12)): ['Vitamin C  18:30', 'Ramipril  20:00'],
      _selectedDay.add(Duration(days: 13)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 14)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 15)): ['Vitamin C  18:30', 'Ibuprofen  09:30'],
      _selectedDay.add(Duration(days: 16)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 17)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 19)): ['Vitamin C  18:30', 'Ramipril  20:00'],
      _selectedDay.add(Duration(days: 20)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 21)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 22)): ['Vitamin C  18:30', 'Ibuprofen  09:30'],
      _selectedDay.add(Duration(days: 23)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 24)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 26)): ['Vitamin C  18:30', 'Ramipril  20:00'],
      _selectedDay.add(Duration(days: 27)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 28)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 29)): ['Vitamin C  18:30', 'Ibuprofen  09:30'],
      _selectedDay.add(Duration(days: 30)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 31)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 33)): ['Vitamin C  18:30', 'Ramipril  20:00'],
      _selectedDay.add(Duration(days: 34)): ['Vitamin C  18:30'],
      _selectedDay.add(Duration(days: 35)): ['Vitamin C  18:30'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          // _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          _buildButtons(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.teal[400],
        todayColor: Colors.teal[200],
        markersColor: Colors.teal[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
        TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.teal[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pl_PL',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.teal[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
            ? Colors.brown[300]
            : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),
        SizedBox(height: 8.0),
        RaisedButton(
          child: Text('Add Alarm'),
          onPressed: () {
            scheduleAlarm();
            final snackBar = SnackBar(
                content: Text('Alarm set successfully!'),
                duration: Duration(seconds: 2)
            );

            print('Alarm set successfully!');
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin:
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          title: Text(event.toString()),
          onTap: () => print('$event tapped!'),
        ),
      ))
          .toList(),
    );
  }

  void scheduleAlarm() async {
    var scheduledNotificationDateTime = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));

    var android = new AndroidNotificationDetails(
      'Nightingale ID',
      'Nightingale',
      'It is time to take your medicine',
      sound: RawResourceAndroidNotificationSound('nightingale_alarm_1'),
      icon: 'alarm_icon',
      largeIcon: DrawableResourceAndroidBitmap('nightingale_logo'),
      enableLights: true,
      color: const Color.fromARGB(255, 255, 0, 0),
      ledColor: const Color.fromARGB(255, 255, 0, 0),
      ledOnMs: 1000,
      ledOffMs: 500,
      priority: Priority.high,
      importance: Importance.max,
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Nightingale',
      'It is time to take your medicine! Click here to see today\'s schedule.',
      scheduledNotificationDateTime,
      platform,
      androidAllowWhileIdle: true,
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen(
      this.payload, {
        Key key,
      }) : super(key: key);

  final String payload;

  @override
  State<StatefulWidget> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  String _payload;
  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Notification Screen'),
    ),
    body: Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SchedulingPage(),
          ));
        },
        child: const Text('Go back!'),
      ),
    ),
  );
}
