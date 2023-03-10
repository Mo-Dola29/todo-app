 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
 import 'package:todo/mythemeData.dart';
import 'package:todo/todolisttab.dart';

 import 'list_provider.dart';

class TodsT extends StatefulWidget {
  const TodsT({Key? key}) : super(key: key);


  @override
  State<TodsT> createState() => _TodsTState();
}

class _TodsTState extends State<TodsT> {


  DateTime focusedDay = DateTime.now();
late ListProvider provider;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500),(){
      provider.refreshTodo();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
provider=Provider.of(context);
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TableCalendar(
            firstDay: DateTime.now().subtract(const Duration(days: 365)),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            focusedDay: focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(provider.selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {

                provider.setSelectedDay(selectedDay);
                provider.refreshTodo();
                this.focusedDay =
                    focusedDay; // update `_focusedDay` here as well
              });
            },
            calendarFormat: CalendarFormat.week,
            daysOfWeekHeight: 30,
            daysOfWeekStyle:
                const DaysOfWeekStyle(decoration: BoxDecoration(color: Colors.white)),
            calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                defaultDecoration: const BoxDecoration(color: Colors.white),
                weekendDecoration: const BoxDecoration(color: Colors.white),
                selectedDecoration:
                    BoxDecoration(color: MyThemeData.primarycolor)),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  return  TodoListTab(provider.items[index]);

                }))
      ],
    );
  }

}
