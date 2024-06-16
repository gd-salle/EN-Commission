class MaterialTransferSlip {
  final String number;
  final DateTime date;
  final String from;
  final String to;
  final String quantity;
  final String unit;
  final String description;
  final String purpose;
  final String requestedBy;
  final String approvedBy;
  final String receivedBy;
  final String returnedBy;
  final String notedBy;

  MaterialTransferSlip({
    required this.number,
    required this.date,
    required this.from,
    required this.to,
    required this.quantity,
    required this.unit,
    required this.description,
    required this.purpose,
    required this.requestedBy,
    required this.approvedBy,
    required this.receivedBy,
    required this.returnedBy,
    required this.notedBy,
  });
}
