class BookingActionsModel {
  final BookingLog bookingLog;

  BookingActionsModel({required this.bookingLog});

  factory BookingActionsModel.fromJson(Map<String, dynamic> json) {
    return BookingActionsModel(
      bookingLog: BookingLog.fromJson(json['booking_log'] ?? {}),
    );
  }
}

class BookingLog {
  final List<AuditTrail> data;

  BookingLog({required this.data});

  factory BookingLog.fromJson(Map<String, dynamic> json) {
    return BookingLog(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => AuditTrail.fromJson(item))
          .toList() ?? [],
    );
  }
}

class AuditTrail {
  final int id;
  final String remark;
  final String? details; // Nullable
  final int bookingId;
  final int ownerId;
  final ActionBy actionBy;
  final String createdAt;
  final String updatedAt;
  final Booking booking;

  AuditTrail({
    required this.id,
    required this.remark,
    this.details,
    required this.bookingId,
    required this.ownerId,
    required this.actionBy,
    required this.createdAt,
    required this.updatedAt,
    required this.booking,
  });

  factory AuditTrail.fromJson(Map<String, dynamic> json) {
    return AuditTrail(
      id: json['id'] ?? 0,
      remark: json['remark'] ?? '',
      details: json['details'] as String?,
      bookingId: json['booking_id'] ?? 0,
      ownerId: json['owner_id'] ?? 0,
      actionBy: ActionBy.fromJson(json['action_by'] ?? {}),
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      booking: Booking.fromJson(json['booking'] ?? {}),
    );
  }

  @override
  String toString() {
    return 'AuditTrail(id: $id, remark: $remark, details: $details, bookingId: $bookingId, ownerId: $ownerId, actionBy: $actionBy, createdAt: $createdAt, updatedAt: $updatedAt, booking: $booking)';
  }
}

class ActionBy {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String? image;
  final String countryCode;
  final String mobile;
  final Address address;

  ActionBy({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    this.image,
    required this.countryCode,
    required this.mobile,
    required this.address,
  });

  factory ActionBy.fromJson(Map<String, dynamic> json) {
    return ActionBy(
      id: json['id'] ?? 0,
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] as String?,
      countryCode: json['country_code'] ?? '',
      mobile: json['mobile'] ?? '',
      address: Address.fromJson(json['address'] ?? {}),
    );
  }

  @override
  String toString() {
    return 'ActionBy(id: $id, firstname: $firstname, lastname: $lastname, email: $email, image: $image, countryCode: $countryCode, mobile: $mobile, address: $address)';
  }
}

class Booking {
  final int id;
  final String bookingNumber;
  final String checkIn;
  final String checkOut;
  final ContactInfo contactInfo;
  final int totalAdult;
  final int totalChild;
  final String totalDiscount;
  final String taxCharge;
  final String bookingFare;
  final String serviceCost;
  final String extraCharge;
  final String extraChargeSubtracted;
  final String paidAmount;
  final String cancellationFee;
  final String refundedAmount;
  final int keyStatus;
  final int status;
  final String checkedInAt;
  final String? checkedOutAt;
  final String createdAt;
  final String updatedAt;
  final int totalAmount;
  final int dueAmount;
  final int taxPercent;

  Booking({
    required this.id,
    required this.bookingNumber,
    required this.checkIn,
    required this.checkOut,
    required this.contactInfo,
    required this.totalAdult,
    required this.totalChild,
    required this.totalDiscount,
    required this.taxCharge,
    required this.bookingFare,
    required this.serviceCost,
    required this.extraCharge,
    required this.extraChargeSubtracted,
    required this.paidAmount,
    required this.cancellationFee,
    required this.refundedAmount,
    required this.keyStatus,
    required this.status,
    required this.checkedInAt,
    this.checkedOutAt,
    required this.createdAt,
    required this.updatedAt,
    required this.totalAmount,
    required this.dueAmount,
    required this.taxPercent,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] ?? 0,
      bookingNumber: json['booking_number'] ?? '',
      checkIn: json['check_in'] ?? '',
      checkOut: json['check_out'] ?? '',
      contactInfo: ContactInfo.fromJson(json['contact_info'] ?? {}),
      totalAdult: json['total_adult'] ?? 0,
      totalChild: json['total_child'] ?? 0,
      totalDiscount: json['total_discount'] ?? '',
      taxCharge: json['tax_charge'] ?? '',
      bookingFare: json['booking_fare'] ?? '',
      serviceCost: json['service_cost'] ?? '',
      extraCharge: json['extra_charge'] ?? '',
      extraChargeSubtracted: json['extra_charge_subtracted'] ?? '',
      paidAmount: json['paid_amount'] ?? '',
      cancellationFee: json['cancellation_fee'] ?? '',
      refundedAmount: json['refunded_amount'] ?? '',
      keyStatus: json['key_status'] ?? 0,
      status: json['status'] ?? 0,
      checkedInAt: json['checked_in_at'] ?? '',
      checkedOutAt: json['checked_out_at'] as String?,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      totalAmount: json['total_amount'] ?? 0,
      dueAmount: json['due_amount'] ?? 0,
      taxPercent: json['tax_percent'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Booking(id: $id, bookingNumber: $bookingNumber, checkIn: $checkIn, checkOut: $checkOut, contactInfo: $contactInfo, totalAdult: $totalAdult, totalChild: $totalChild, totalDiscount: $totalDiscount, taxCharge: $taxCharge, bookingFare: $bookingFare, serviceCost: $serviceCost, extraCharge: $extraCharge, extraChargeSubtracted: $extraChargeSubtracted, paidAmount: $paidAmount, cancellationFee: $cancellationFee, refundedAmount: $refundedAmount, keyStatus: $keyStatus, status: $status, checkedInAt: $checkedInAt, checkedOutAt: $checkedOutAt, createdAt: $createdAt, updatedAt: $updatedAt, totalAmount: $totalAmount, dueAmount: $dueAmount, taxPercent: $taxPercent)';
  }
}

class FormData {
  final String name;
  final String type;
  final String value;

  FormData({
    required this.name,
    required this.type,
    required this.value,
  });

  factory FormData.fromJson(Map<String, dynamic> json) {
    return FormData(
      name: json['name'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'value': value,
    };
  }
}

class ContactInfo {
  final String name;
  final String phone;

  ContactInfo({
    required this.name,
    required this.phone,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }
}

class Address {
  final String address;
  final String city;
  final String state;
  final String zip;
  final String country;

  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zip: json['zip'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'city': city,
      'state': state,
      'zip': zip,
      'country': country,
    };
  }
}
