import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final ValueChanged<DateTime> onChanged;
  final String placeholder;

  const DatePickerField({Key? key, required this.onChanged, required this.placeholder}) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  String _selectedDateText = '';
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _selectedDateText = _selectedDate.toString().substring(0, 10);
        widget.onChanged(_selectedDate!); // Call onChanged with the selected DateTime
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        hintText: widget.placeholder, // Use placeholder specified in widget
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: Icon(Icons.calendar_today), // Calendar icon
      ),
      controller: TextEditingController(text: _selectedDateText),
    );
  }
}
