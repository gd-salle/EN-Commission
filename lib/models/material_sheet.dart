class MaterialSheet {
  int? id;
   String department;
   String laboratory;
   String date;
   String accountablePerson;
   int qty;
   String unit;
   String description;
   String poNumber;
   String accountCode;
   String accountName;
   String tagNumber;
   String acquisitionDate;
   String location;
   double unitPrice;
   double total;
   String remarks;
   String mrNumber;

  MaterialSheet({
    this.id,
    required this.department,
    required this.laboratory,
    required this.date,
    required this.accountablePerson,
    required this.qty,
    required this.unit,
    required this.description,
    required this.poNumber,
    required this.accountCode,
    required this.accountName,
    required this.tagNumber,
    required this.acquisitionDate,
    required this.location,
    required this.unitPrice,
    required this.total,
    required this.remarks,
    required this.mrNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'department': department,
      'laboratory': laboratory,
      'date': date,
      'accountable_person': accountablePerson,
      'qty': qty,
      'unit': unit,
      'description': description,
      'po_number': poNumber,
      'account_code': accountCode,
      'account_name': accountName,
      'tag_number': tagNumber,
      'acquisition_date': acquisitionDate,
      'location': location,
      'unit_price': unitPrice,
      'total': total,
      'remarks': remarks,
      'mr_number': mrNumber,
    };
  }

  factory MaterialSheet.fromJson(Map<String, dynamic> json) {
    return MaterialSheet(
      id: json['id'],
      department: json['department'],
      laboratory: json['laboratory'],
      date: json['date'],
      accountablePerson: json['accountable_person'],
      qty: json['qty'],
      unit: json['unit'],
      description: json['description'],
      poNumber: json['po_number'],
      accountCode: json['account_code'],
      accountName: json['account_name'],
      tagNumber: json['tag_number'],
      acquisitionDate: json['acquisition_date'],
      location: json['location'],
      unitPrice: double.parse(json['unit_price']),
      total: double.parse(json['total']),
      remarks: json['remarks'],
      mrNumber: json['mr_number'],
    );
  }
}
