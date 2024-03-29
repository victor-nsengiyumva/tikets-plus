
import 'package:cinema_tikets/notifiers/for_metro/seat_number_notifier-metro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Seat_metro extends StatefulWidget {
  bool taken;
  Color? seatColor;
  IconData? icon;
  int index;

  Seat_metro(
      {super.key,
      required this.index,
      this.taken = false,
      this.seatColor = Colors.green,
      this.icon});

  @override
  State<Seat_metro> createState() => _SeatState();
}

class _SeatState extends State<Seat_metro> {
  dynamic value;
  // @override
  // void initState() {
  //   print('yeah the list is empty');
  //   print('yeah the list is empty'); // Dont remove this code, its working as a disguised async....
  //   print('yeah the list is empty');
  //   print('yeah the list is empty');
  //   int index = 0;
  //   TakenSeat_metro takenSeat = Provider.of<TakenSeat_metro>(context, listen: false);
  //   List stuff = takenSeat.seatList[index].seat;
  //   if (takenSeat.seatList[0].seat != null) {
  //     if (stuff.contains(widget.index + 1)) {
  //       setState(() {
  //         widget.taken = true;
  //       });
  //     }
  //   } else {
  //     print('yeah the list is empty'); // also this....dont remove this
  //   }

  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        disabledColor: Colors.blue,
        // enableFeedback: widget.taken == true?false:true,
        onPressed: widget.taken == true
            ? null
            : () {
                setState(() {
                  if (widget.seatColor == Colors.green) {
                    widget.seatColor = Colors.orange;
                    Provider.of<SeatNumberModel_metro>(context, listen: false)
                        .add(widget.index + 1);
                    Provider.of<SeatNumberModel_metro>(context, listen: false)
                        .addPrice(widget.index + 1);
                    // addSeat_metro(widget.index+1);
                  } else {
                    widget.seatColor = Colors.green;
                    
                    Provider.of<SeatNumberModel_metro>(context, listen: false)
                        .remove(widget.index + 1);
                    Provider.of<SeatNumberModel_metro>(context, listen: false)
                        .reducePrice(widget.index + 1);
                    // removeSeat_metro(widget.index+1);
                  }
                });
              },
        icon: Icon(
          Icons.chair,
          size: 50,
          color: widget.taken == true ? Colors.blue : widget.seatColor,
        ));
  }
}
