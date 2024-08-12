// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  String remark;
  String status;
  Message message;
  Data data;

  Booking({
    required this.remark,
    required this.status,
    required this.message,
    required this.data,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    remark: json["remark"],
    status: json["status"],
    message: Message.fromJson(json["message"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "remark": remark,
    "status": status,
    "message": message.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  BookingClass booking;
  BookedRooms bookedRooms;
  PaymentInfo paymentInfo;

  Data({
    required this.booking,
    required this.bookedRooms,
    required this.paymentInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    booking: BookingClass.fromJson(json["booking"]),
    bookedRooms: BookedRooms.fromJson(json["bookedRooms"]),
    paymentInfo: PaymentInfo.fromJson(json["paymentInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "booking": booking.toJson(),
    "bookedRooms": bookedRooms.toJson(),
    "paymentInfo": paymentInfo.toJson(),
  };
}

class BookedRooms {
  Map<String, List<The20240729>> roomsByDate;

  BookedRooms({
    required this.roomsByDate,
  });

  factory BookedRooms.fromJson(Map<String, dynamic> json) {
    // Dynamically parse the rooms by date
    final Map<String, List<The20240729>> roomsMap = {};
    json.forEach((key, value) {
      roomsMap[key] = List<The20240729>.from(value.map((x) => The20240729.fromJson(x)));
    });
    return BookedRooms(roomsByDate: roomsMap);
  }

  Map<String, dynamic> toJson() {
    // Convert map to JSON
    final Map<String, dynamic> jsonMap = {};
    roomsByDate.forEach((key, value) {
      jsonMap[key] = List<dynamic>.from(value.map((x) => x.toJson()));
    });
    return jsonMap;
  }
}


class The20240729 {
  int id;
  int bookingId;
  int roomTypeId;
  int roomId;
  String roomNumber;
  DateTime bookedFor;
  String fare;
  String discount;
  String taxCharge;
  String cancellationFee;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  Room? room;
  RoomType? roomType;

  The20240729({
    required this.id,
    required this.bookingId,
    required this.roomTypeId,
    required this.roomId,
    required this.roomNumber,
    required this.bookedFor,
    required this.fare,
    required this.discount,
    required this.taxCharge,
    required this.cancellationFee,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.room,
    this.roomType,
  });

  factory The20240729.fromJson(Map<String, dynamic> json) => The20240729(
    id: json["id"],
    bookingId: json["booking_id"],
    roomTypeId: json["room_type_id"],
    roomId: json["room_id"],
    roomNumber: json["room_number"],
    bookedFor: DateTime.parse(json["booked_for"]),
    fare: json["fare"],
    discount: json["discount"],
    taxCharge: json["tax_charge"],
    cancellationFee: json["cancellation_fee"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    room: json["room"] == null ? null : Room.fromJson(json["room"]),
    roomType: json["room_type"] == null ? null : RoomType.fromJson(json["room_type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "room_type_id": roomTypeId,
    "room_id": roomId,
    "room_number": roomNumber,
    "booked_for": "${bookedFor.year.toString().padLeft(4, '0')}-${bookedFor.month.toString().padLeft(2, '0')}-${bookedFor.day.toString().padLeft(2, '0')}",
    "fare": fare,
    "discount": discount,
    "tax_charge": taxCharge,
    "cancellation_fee": cancellationFee,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "room": room?.toJson(),
    "room_type": roomType?.toJson(),
  };
}

class Room {
  int id;
  int ownerId;
  int roomTypeId;
  String roomNumber;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Room({
    required this.id,
    required this.ownerId,
    required this.roomTypeId,
    required this.roomNumber,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
    id: json["id"],
    ownerId: json["owner_id"],
    roomTypeId: json["room_type_id"],
    roomNumber: json["room_number"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_id": ownerId,
    "room_type_id": roomTypeId,
    "room_number": roomNumber,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class RoomType {
  int id;
  String name;
  String image;
  int discountedFare;
  int discount;
  List<Image> images;

  RoomType({
    required this.id,
    required this.name,
    required this.image,
    required this.discountedFare,
    required this.discount,
    required this.images,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    discountedFare: json["discounted_fare"],
    discount: json["discount"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "discounted_fare": discountedFare,
    "discount": discount,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  int id;
  int roomTypeId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Image({
    required this.id,
    required this.roomTypeId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    roomTypeId: json["room_type_id"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "room_type_id": roomTypeId,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class BookingClass {
  int id;
  int ownerId;
  String bookingNumber;
  int userId;
  int guestId;
  DateTime checkIn;
  DateTime checkOut;
  ContactInfo contactInfo;
  int totalAdult;
  int totalChild;
  String totalDiscount;
  String taxCharge;
  String bookingFare;
  String serviceCost;
  String extraCharge;
  String extraChargeSubtracted;
  String paidAmount;
  String cancellationFee;
  String refundedAmount;
  int keyStatus;
  int status;
  dynamic checkedInAt;
  DateTime checkedOutAt;
  DateTime createdAt;
  DateTime updatedAt;
  int totalAmount;
  int dueAmount;
  int taxPercent;
  List<dynamic> usedExtraService;
  List<Payment> payments;
  dynamic guest;
  Owner owner;
  List<The20240729> bookedRooms;

  BookingClass({
    required this.id,
    required this.ownerId,
    required this.bookingNumber,
    required this.userId,
    required this.guestId,
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
    required this.checkedOutAt,
    required this.createdAt,
    required this.updatedAt,
    required this.totalAmount,
    required this.dueAmount,
    required this.taxPercent,
    required this.usedExtraService,
    required this.payments,
    required this.guest,
    required this.owner,
    required this.bookedRooms,
  });

  factory BookingClass.fromJson(Map<String, dynamic> json) => BookingClass(
    id: json["id"],
    ownerId: json["owner_id"],
    bookingNumber: json["booking_number"],
    userId: json["user_id"],
    guestId: json["guest_id"],
    checkIn: DateTime.parse(json["check_in"]),
    checkOut: DateTime.parse(json["check_out"]),
    contactInfo: ContactInfo.fromJson(json["contact_info"]),
    totalAdult: json["total_adult"],
    totalChild: json["total_child"],
    totalDiscount: json["total_discount"],
    taxCharge: json["tax_charge"],
    bookingFare: json["booking_fare"],
    serviceCost: json["service_cost"],
    extraCharge: json["extra_charge"],
    extraChargeSubtracted: json["extra_charge_subtracted"],
    paidAmount: json["paid_amount"],
    cancellationFee: json["cancellation_fee"],
    refundedAmount: json["refunded_amount"],
    keyStatus: json["key_status"],
    status: json["status"],
    checkedInAt: json["checked_in_at"],
    checkedOutAt: DateTime.parse(json["checked_out_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    totalAmount: json["total_amount"],
    dueAmount: json["due_amount"],
    taxPercent: json["tax_percent"],
    usedExtraService: List<dynamic>.from(json["used_extra_service"].map((x) => x)),
    payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
    guest: json["guest"],
    owner: Owner.fromJson(json["owner"]),
    bookedRooms: List<The20240729>.from(json["booked_rooms"].map((x) => The20240729.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_id": ownerId,
    "booking_number": bookingNumber,
    "user_id": userId,
    "guest_id": guestId,
    "check_in": "${checkIn.year.toString().padLeft(4, '0')}-${checkIn.month.toString().padLeft(2, '0')}-${checkIn.day.toString().padLeft(2, '0')}",
    "check_out": "${checkOut.year.toString().padLeft(4, '0')}-${checkOut.month.toString().padLeft(2, '0')}-${checkOut.day.toString().padLeft(2, '0')}",
    "contact_info": contactInfo.toJson(),
    "total_adult": totalAdult,
    "total_child": totalChild,
    "total_discount": totalDiscount,
    "tax_charge": taxCharge,
    "booking_fare": bookingFare,
    "service_cost": serviceCost,
    "extra_charge": extraCharge,
    "extra_charge_subtracted": extraChargeSubtracted,
    "paid_amount": paidAmount,
    "cancellation_fee": cancellationFee,
    "refunded_amount": refundedAmount,
    "key_status": keyStatus,
    "status": status,
    "checked_in_at": checkedInAt,
    "checked_out_at": checkedOutAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "total_amount": totalAmount,
    "due_amount": dueAmount,
    "tax_percent": taxPercent,
    "used_extra_service": List<dynamic>.from(usedExtraService.map((x) => x)),
    "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
    "guest": guest,
    "owner": owner.toJson(),
    "booked_rooms": List<dynamic>.from(bookedRooms.map((x) => x.toJson())),
  };
}

class ContactInfo {
  String name;
  String phone;

  ContactInfo({
    required this.name,
    required this.phone,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
  };
}

class Owner {
  int id;
  String firstname;
  HotelSetting hotelSetting;

  Owner({
    required this.id,
    required this.firstname,
    required this.hotelSetting,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"],
    firstname: json["firstname"],
    hotelSetting: HotelSetting.fromJson(json["hotel_setting"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "hotel_setting": hotelSetting.toJson(),
  };
}

class HotelSetting {
  int id;
  int ownerId;
  int locationId;
  int cityId;
  int countryId;
  String name;
  String image;
  String taxName;
  String imageUrl;
  Location location;
  City city;
  Country country;

  HotelSetting({
    required this.id,
    required this.ownerId,
    required this.locationId,
    required this.cityId,
    required this.countryId,
    required this.name,
    required this.image,
    required this.taxName,
    required this.imageUrl,
    required this.location,
    required this.city,
    required this.country,
  });

  factory HotelSetting.fromJson(Map<String, dynamic> json) => HotelSetting(
    id: json["id"],
    ownerId: json["owner_id"],
    locationId: json["location_id"],
    cityId: json["city_id"],
    countryId: json["country_id"],
    name: json["name"],
    image: json["image"],
    taxName: json["tax_name"],
    imageUrl: json["image_url"],
    location: Location.fromJson(json["location"]),
    city: City.fromJson(json["city"]),
    country: Country.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_id": ownerId,
    "location_id": locationId,
    "city_id": cityId,
    "country_id": countryId,
    "name": name,
    "image": image,
    "tax_name": taxName,
    "image_url": imageUrl,
    "location": location.toJson(),
    "city": city.toJson(),
    "country": country.toJson(),
  };
}

class City {
  int id;
  int countryId;
  String name;
  String image;
  int isPopular;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;

  City({
    required this.id,
    required this.countryId,
    required this.name,
    required this.image,
    required this.isPopular,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    countryId: json["country_id"],
    name: json["name"],
    image: json["image"],
    isPopular: json["is_popular"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_id": countryId,
    "name": name,
    "image": image,
    "is_popular": isPopular,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image_url": imageUrl,
  };
}

class Country {
  int id;
  String name;
  String code;
  String dialCode;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.dialCode,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    dialCode: json["dial_code"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "dial_code": dialCode,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Location {
  int id;
  int cityId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  Location({
    required this.id,
    required this.cityId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    cityId: json["city_id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_id": cityId,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Payment {
  int id;
  int ownerId;
  int bookingId;
  String amount;
  String type;
  String paymentSystem;
  int actionBy;
  DateTime createdAt;
  DateTime updatedAt;

  Payment({
    required this.id,
    required this.ownerId,
    required this.bookingId,
    required this.amount,
    required this.type,
    required this.paymentSystem,
    required this.actionBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    ownerId: json["owner_id"],
    bookingId: json["booking_id"],
    amount: json["amount"],
    type: json["type"],
    paymentSystem: json["payment_system"],
    actionBy: json["action_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_id": ownerId,
    "booking_id": bookingId,
    "amount": amount,
    "type": type,
    "payment_system": paymentSystem,
    "action_by": actionBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class PaymentInfo {
  int subtotal;
  int totalAmount;
  int canceledFare;
  int canceledTaxCharge;
  int paymentReceived;
  int refunded;

  PaymentInfo({
    required this.subtotal,
    required this.totalAmount,
    required this.canceledFare,
    required this.canceledTaxCharge,
    required this.paymentReceived,
    required this.refunded,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
    subtotal: json["subtotal"],
    totalAmount: json["total_amount"],
    canceledFare: json["canceled_fare"],
    canceledTaxCharge: json["canceled_tax_charge"],
    paymentReceived: json["payment_received"],
    refunded: json["refunded"],
  );

  Map<String, dynamic> toJson() => {
    "subtotal": subtotal,
    "total_amount": totalAmount,
    "canceled_fare": canceledFare,
    "canceled_tax_charge": canceledTaxCharge,
    "payment_received": paymentReceived,
    "refunded": refunded,
  };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    success: List<String>.from(json["success"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": List<dynamic>.from(success.map((x) => x)),
  };
}
