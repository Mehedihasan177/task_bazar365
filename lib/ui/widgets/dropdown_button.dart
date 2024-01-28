import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {
  final bool show;
  const DropdownButtonWidget({super.key, required this.show});

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
   List<String> list = <String>["Sort By Position", 'One', 'Two', 'Three', 'Four'];
  String? dropdownValue;
@override
  void initState() {
    // dropdownValue = list.first;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1)),
      child: DropdownButton<String>(
        value: dropdownValue,
        hint: widget.show == true?  Text.rich(
  TextSpan(
    children: [
      TextSpan(text: 'Sort By '),
      TextSpan(
        text: 'Position',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      
    ],
  ),
): Text.rich(
  TextSpan(
    children: [
      TextSpan(text: 'Show'),
      TextSpan(
        text: '16',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      
    ],
  ),
),
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
