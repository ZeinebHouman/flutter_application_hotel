import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
DateTime kNow = DateTime.now();
DateTime kFirstDay = DateTime(kNow.year, kNow.month - 3, kNow.day);
DateTime kLastDay = DateTime(kNow.year, kNow.month + 3, kNow.day);

const d_green = const Color(0xFF54D3C2);
class CalendarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [ PeriodSection(),CalendarRange()],) 
      ,)

    );
  }
}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context)
  {
    return AppBar(
      leading: IconButton(
      icon: Icon(Icons.arrow_back, 
                  color: Colors.grey[800],
                  size: 20 ),
      onPressed: (){Navigator.pop(context);}
      ),
       backgroundColor: Colors.white, 

     
    );
  } 

}
class PeriodSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [ 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text('Depart', textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey[700]),
            ),
            SizedBox(height:4),
            Text('Month 12 Dec', textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

          ],),
          //Pour le trait vertical
          Container( height: 60 , width: 1, color : Colors.grey[350],),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text('Return', textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey[700]),
            ),
            SizedBox(height:4),
            Text('Tues 22 Dec', textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)

          


          ],),
           //Pour le trait horizontale
           Divider(
             color: Colors.blue,
             height: 1,
           )


        ],


      )
    ]);
  }
}
//Statful car  le contenu de note section sera modifié en fonction des actions de l’utilisateur, notamment lors de la sélection des jours sur le calendrier
class CalendarRange extends StatefulWidget{
  @override
   _CalendarRangeState createState() => _CalendarRangeState();
}
class _CalendarRangeState extends State<CalendarRange>{
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode=RangeSelectionMode.toggledOn;
  DateTime _focusedDay=DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
   DateTime? _rangeEnd;


   @override
   Widget build(BuildContext context)
   {
     return Container(
       padding: EdgeInsets.all(15),
       color: Colors.grey[10],
       child: Expanded(
         child: TableCalendar(
           lastDay: kLastDay,
           focusedDay: _focusedDay,
           selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
           rangeStartDay: _rangeStart,
           rangeEndDay: _rangeEnd,
           calendarFormat: _calendarFormat,
           headerStyle: HeaderStyle(
             titleCentered: true,formatButtonVisible: false,
             titleTextStyle: TextStyle(fontSize: 18),
           ),
           calendarStyle: CalendarStyle(
             isTodayHighlighted: false,
             rangeHighlightColor: d_green,
             rangeStartDecoration: BoxDecoration(
               color: d_green,
               shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                color: Colors.white, 
                width: 3,
                style: BorderStyle.solid))
             ),
             withinRangeTextStyle: TextStyle(color: Colors.white),
              rangeEndDecoration: BoxDecoration(
              color: d_green,
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.white,
                  width: 3,
                  style: BorderStyle.solid,
                ),
              ),
            ),
           ),
           firstDay: kFirstDay,
          rangeSelectionMode: _rangeSelectionMode,
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _rangeStart = null;
                _rangeEnd = null;
                _rangeSelectionMode = RangeSelectionMode.toggledOff;
              });
            }
          },
          onRangeSelected: (start, end, focusedDay) {
            setState(() {
              _selectedDay = null;
              _focusedDay = focusedDay;
              _rangeStart = start;
              _rangeEnd = end;
              _rangeSelectionMode = RangeSelectionMode.toggledOn;
            });
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
      ),
    );
  }
}