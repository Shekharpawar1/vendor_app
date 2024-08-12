// class BookingResponse {
//   final BookingData data;
//
//   BookingResponse({required this.data});
//
//   factory BookingResponse.fromJson(Map<String, dynamic> json) {
//     return BookingResponse(
//       data: BookingData.fromJson(json['data']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'data': data.toJson(),
//     };
//   }
// }
//
// class BookingData {
//   final BookingDetails booking;
//   final Map<String, List<Room>> bookedRooms; // Assuming bookedRooms is a Map
//   final PaymentInfo paymentInfo;
//
//   BookingData({
//     required this.booking,
//     required this.bookedRooms,
//     required this.paymentInfo,
//   });
//
//   factory BookingData.fromJson(Map<String, dynamic> json) {
//     return BookingData(
//       booking: BookingDetails.fromJson(json['booking']),
//       bookedRooms: (json['bookedRooms'] as Map<String, dynamic>).map(
//             (key, value) => MapEntry(
//           key,
//           (value as List).map((room) => Room.fromJson(room)).toList(),
//         ),
//       ),
//       paymentInfo: PaymentInfo.fromJson(json['paymentInfo']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'booking': booking.toJson(),
//       'bookedRooms': bookedRooms.map(
//             (key, value) => MapEntry(key, value.map((room) => room.toJson()).toList()),
//       ),
//       'paymentInfo': paymentInfo.toJson(),
//     };
//   }
// }
//
// class BookingDetails {
//   num? id; // Can be num or String
//   int? ownerId;
//   String? bookingNumber;
//   int? userId;
//   int? guestId;
//   String? checkIn;
//   String? checkOut;
//   ContactInfo? contactInfo;
//   int? totalAdult;
//   int? totalChild;
//   String? totalDiscount;
//   String? taxCharge;
//   String? bookingFare;
//   String? serviceCost;
//   String? extraCharge;
//   String? extraChargeSubtracted;
//   String? paidAmount;
//   String? cancellationFee;
//   String? refundedAmount;
//   int? keyStatus;
//   int? status;
//   String? checkedInAt;
//   String? checkedOutAt;
//   String? createdAt;
//   String? updatedAt;
//   double? totalAmount;
//   double? dueAmount;
//   int? taxPercent;
//   List<dynamic>? usedExtraService;
//   List<dynamic>? payments;
//   dynamic guest;
//   HotelOwner? owner;
//   List<BookedRoomDetails>? bookedRooms;
//
//   BookingDetails({
//     this.id,
//     this.ownerId,
//     this.bookingNumber,
//     this.userId,
//     this.guestId,
//     this.checkIn,
//     this.checkOut,
//     this.contactInfo,
//     this.totalAdult,
//     this.totalChild,
//     this.totalDiscount,
//     this.taxCharge,
//     this.bookingFare,
//     this.serviceCost,
//     this.extraCharge,
//     this.extraChargeSubtracted,
//     this.paidAmount,
//     this.cancellationFee,
//     this.refundedAmount,
//     this.keyStatus,
//     this.status,
//     this.checkedInAt,
//     this.checkedOutAt,
//     this.createdAt,
//     this.updatedAt,
//     this.totalAmount,
//     this.dueAmount,
//     this.taxPercent,
//     this.usedExtraService,
//     this.payments,
//     this.guest,
//     this.owner,
//     this.bookedRooms,
//   });
//
//   factory BookingDetails.fromJson(Map<String, dynamic> json) {
//     return BookingDetails(
//       id: json['id'] != null ? num.tryParse(json['id'].toString()) : null,
//       ownerId: json['owner_id'] != null ? int.tryParse(json['owner_id'].toString()) : null,
//       bookingNumber: json['booking_number']?.toString(),
//       userId: json['user_id'] != null ? int.tryParse(json['user_id'].toString()) : null,
//       guestId: json['guest_id'] != null ? int.tryParse(json['guest_id'].toString()) : null,
//       checkIn: json['check_in'],
//       checkOut: json['check_out'],
//       contactInfo: json['contact_info'] != null
//           ? ContactInfo.fromJson(json['contact_info'])
//           : null,
//       totalAdult: json['total_adult'] != null ? int.tryParse(json['total_adult'].toString()) : null,
//       totalChild: json['total_child'] != null ? int.tryParse(json['total_child'].toString()) : null,
//       totalDiscount: json['total_discount']?.toString(),
//       taxCharge: json['tax_charge']?.toString(),
//       bookingFare: json['booking_fare']?.toString(),
//       serviceCost: json['service_cost']?.toString(),
//       extraCharge: json['extra_charge']?.toString(),
//       extraChargeSubtracted: json['extra_charge_subtracted']?.toString(),
//       paidAmount: json['paid_amount']?.toString(),
//       cancellationFee: json['cancellation_fee']?.toString(),
//       refundedAmount: json['refunded_amount']?.toString(),
//       keyStatus: json['key_status'] != null ? int.tryParse(json['key_status'].toString()) : null,
//       status: json['status'] != null ? int.tryParse(json['status'].toString()) : null,
//       checkedInAt: json['checked_in_at'],
//       checkedOutAt: json['checked_out_at'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       totalAmount: json['total_amount'] != null ? (json['total_amount'] as num).toDouble() : null,
//       dueAmount: json['due_amount'] != null ? (json['due_amount'] as num).toDouble() : null,
//       taxPercent: json['tax_percent'] != null ? int.tryParse(json['tax_percent'].toString()) : null,
//       usedExtraService: json['used_extra_service']?.cast<dynamic>(),
//       payments: json['payments']?.cast<dynamic>(),
//       guest: json['guest'],
//       owner: json['owner'] != null ? HotelOwner.fromJson(json['owner']) : null,
//       bookedRooms: (json['booked_rooms'] as List<dynamic>?)
//           ?.map((i) => BookedRoomDetails.fromJson(i))
//           .toList(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id?.toString(), // Convert num to String
//       'owner_id': ownerId,
//       'booking_number': bookingNumber,
//       'user_id': userId,
//       'guest_id': guestId,
//       'check_in': checkIn,
//       'check_out': checkOut,
//       'contact_info': contactInfo?.toJson(),
//       'total_adult': totalAdult,
//       'total_child': totalChild,
//       'total_discount': totalDiscount,
//       'tax_charge': taxCharge,
//       'booking_fare': bookingFare,
//       'service_cost': serviceCost,
//       'extra_charge': extraCharge,
//       'extra_charge_subtracted': extraChargeSubtracted,
//       'paid_amount': paidAmount,
//       'cancellation_fee': cancellationFee,
//       'refunded_amount': refundedAmount,
//       'key_status': keyStatus,
//       'status': status,
//       'checked_in_at': checkedInAt,
//       'checked_out_at': checkedOutAt,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'total_amount': totalAmount,
//       'due_amount': dueAmount,
//       'tax_percent': taxPercent,
//       'used_extra_service': usedExtraService,
//       'payments': payments,
//       'guest': guest,
//       'owner': owner?.toJson(),
//       'booked_rooms': bookedRooms?.map((i) => i.toJson()).toList(),
//     };
//   }
// }
//
// class ContactInfo {
//   String? name;
//   String? phone;
//
//   ContactInfo({this.name, this.phone});
//
//   factory ContactInfo.fromJson(Map<String, dynamic> json) {
//     return ContactInfo(
//       name: json['name'],
//       phone: json['phone'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'phone': phone,
//     };
//   }
// }
//
// class HotelOwner {
//   int? id;
//   String? firstname;
//   HotelSetting? hotelSetting;
//
//   HotelOwner({this.id, this.firstname, this.hotelSetting});
//
//   factory HotelOwner.fromJson(Map<String, dynamic> json) {
//     return HotelOwner(
//       id: json['id'],
//       firstname: json['firstname'],
//       hotelSetting: json['hotel_setting'] != null
//           ? HotelSetting.fromJson(json['hotel_setting'])
//           : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'firstname': firstname,
//       'hotel_setting': hotelSetting?.toJson(),
//     };
//   }
// }
//
// class HotelSetting {
//   int? id;
//   int? ownerId;
//   int? locationId;
//   int? cityId;
//   int? countryId;
//   String? name;
//   String? image;
//   String? taxName;
//   String? imageUrl;
//   Location? location;
//   City? city;
//   Country? country;
//
//   HotelSetting({
//     this.id,
//     this.ownerId,
//     this.locationId,
//     this.cityId,
//     this.countryId,
//     this.name,
//     this.image,
//     this.taxName,
//     this.imageUrl,
//     this.location,
//     this.city,
//     this.country,
//   });
//
//   factory HotelSetting.fromJson(Map<String, dynamic> json) {
//     return HotelSetting(
//       id: json['id'],
//       ownerId: json['owner_id'],
//       locationId: json['location_id'],
//       cityId: json['city_id'],
//       countryId: json['country_id'],
//       name: json['name'],
//       image: json['image'],
//       taxName: json['tax_name'],
//       imageUrl: json['image_url'],
//       location: json['location'] != null ? Location.fromJson(json['location']) : null,
//       city: json['city'] != null ? City.fromJson(json['city']) : null,
//       country: json['country'] != null ? Country.fromJson(json['country']) : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'owner_id': ownerId,
//       'location_id': locationId,
//       'city_id': cityId,
//       'country_id': countryId,
//       'name': name,
//       'image': image,
//       'tax_name': taxName,
//       'image_url': imageUrl,
//       'location': location?.toJson(),
//       'city': city?.toJson(),
//       'country': country?.toJson(),
//     };
//   }
// }
//
// class Location {
//   int? id;
//   String? name;
//
//   Location({this.id, this.name});
//
//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }
// }
//
// class City {
//   int? id;
//   String? name;
//
//   City({this.id, this.name});
//
//   factory City.fromJson(Map<String, dynamic> json) {
//     return City(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }
// }
//
// class Country {
//   int? id;
//   String? name;
//
//   Country({this.id, this.name});
//
//   factory Country.fromJson(Map<String, dynamic> json) {
//     return Country(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }
// }
//
// class BookedRoomDetails {
//   int? id;
//   String? bookingNumber;
//   String? roomNumber;
//   String? roomFare;
//   String? roomDiscount;
//   String? cancellationFee;
//   RoomType? roomType; // RoomType is a separate class
//
//   BookedRoomDetails({
//     this.id,
//     this.bookingNumber,
//     this.roomNumber,
//     this.roomFare,
//     this.roomDiscount,
//     this.cancellationFee,
//     this.roomType,
//   });
//
//   factory BookedRoomDetails.fromJson(Map<String, dynamic> json) {
//     return BookedRoomDetails(
//       id: json['id'],
//       bookingNumber: json['booking_number'],
//       roomNumber: json['room_number'],
//       roomFare: json['room_fare'],
//       roomDiscount: json['room_discount'],
//       cancellationFee: json['cancellation_fee'],
//       roomType: json['room_type'] != null ? RoomType.fromJson(json['room_type']) : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'booking_number': bookingNumber,
//       'room_number': roomNumber,
//       'room_fare': roomFare,
//       'room_discount': roomDiscount,
//       'cancellation_fee': cancellationFee,
//       'room_type': roomType?.toJson(),
//     };
//   }
// }
//
// class RoomType {
//   final int? id;
//   final String? name;
//   final String? image;
//   final String? price;
//   final List<RoomImage>? images;
//
//   RoomType({
//     this.id,
//     this.name,
//     this.image,
//     this.price,
//     this.images,
//   });
//
//   factory RoomType.fromJson(Map<String, dynamic> json) {
//     return RoomType(
//       id: json['id'] as int?,
//       name: json['name'] as String?,
//       image: json['image'] as String?,
//       price: json['price'] as String?,
//       images: json['images'] != null
//           ? (json['images'] as List<dynamic>).map((imageJson) {
//         return RoomImage.fromJson(imageJson as Map<String, dynamic>);
//       }).toList()
//           : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'image': image,
//       'price': price,
//       'images': images != null
//           ? images!.map((image) => image.toJson()).toList()
//           : null,
//     };
//   }
// }
//
// class RoomImage {
//   final String? imageUrl;
//
//   RoomImage({this.imageUrl});
//
//   factory RoomImage.fromJson(Map<String, dynamic> json) {
//     return RoomImage(
//       imageUrl: json['image_url'] as String?,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'image_url': imageUrl,
//     };
//   }
// }
//
// class Room {
//   int? id;
//   String? name;
//   String? roomNumber;
//
//   Room({this.id, this.name, this.roomNumber});
//
//   factory Room.fromJson(Map<String, dynamic> json) {
//     return Room(
//       id: json['id'],
//       name: json['name'],
//       roomNumber: json['room_number'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'room_number': roomNumber,
//     };
//   }
// }
//
//
// class PaymentInfo {
//   String? totalAmount;
//   String? paidAmount;
//   String? dueAmount;
//
//   PaymentInfo({this.totalAmount, this.paidAmount, this.dueAmount});
//
//   factory PaymentInfo.fromJson(Map<String, dynamic> json) {
//     return PaymentInfo(
//       totalAmount: json['total_amount']?.toString(),
//       paidAmount: json['paid_amount']?.toString(),
//       dueAmount: json['due_amount']?.toString(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'total_amount': totalAmount,
//       'paid_amount': paidAmount,
//       'due_amount': dueAmount,
//     };
//   }
// }

class Booking {
  final int id;
  final int ownerId;
  final String bookingNumber;
  final int userId;
  final int guestId;
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
  final String? checkedInAt;
  final String? checkedOutAt;
  final String createdAt;
  final String updatedAt;
  final int totalAmount;
  final int dueAmount;
  final int taxPercent;
  final List<BookedRoom> bookedRooms;
  final Guest guest;
  final Owner owner;
  final PaymentInfo paymentInfo;

  Booking({
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
    required this.bookedRooms,
    required this.guest,
    required this.owner,
    required this.paymentInfo,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      ownerId: json['owner_id'],
      bookingNumber: json['booking_number'],
      userId: json['user_id'],
      guestId: json['guest_id'],
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      contactInfo: ContactInfo.fromJson(json['contact_info']),
      totalAdult: json['total_adult'],
      totalChild: json['total_child'],
      totalDiscount: json['total_discount'],
      taxCharge: json['tax_charge'],
      bookingFare: json['booking_fare'],
      serviceCost: json['service_cost'],
      extraCharge: json['extra_charge'],
      extraChargeSubtracted: json['extra_charge_subtracted'],
      paidAmount: json['paid_amount'],
      cancellationFee: json['cancellation_fee'],
      refundedAmount: json['refunded_amount'],
      keyStatus: json['key_status'],
      status: json['status'],
      checkedInAt: json['checked_in_at'],
      checkedOutAt: json['checked_out_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      totalAmount: json['total_amount'],
      dueAmount: json['due_amount'],
      taxPercent: json['tax_percent'],
      bookedRooms: (json['booked_rooms'] as List)
          .map((i) => BookedRoom.fromJson(i))
          .toList(),
      guest: Guest.fromJson(json['guest']),
      owner: Owner.fromJson(json['owner']),
      paymentInfo: PaymentInfo.fromJson(json['payment_info']),
    );
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
      name: json['name'],
      phone: json['phone'],
    );
  }
}

class Guest {
  final int id;
  final String name;
  final String mobile;
  final String email;
  final String address;
  final String createdAt;
  final String updatedAt;

  Guest({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      address: json['address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Owner {
  final int id;
  final String firstname;
  final HotelSetting hotelSetting;

  Owner({
    required this.id,
    required this.firstname,
    required this.hotelSetting,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'],
      firstname: json['firstname'],
      hotelSetting: HotelSetting.fromJson(json['hotel_setting']),
    );
  }
}

class HotelSetting {
  final int id;
  final int ownerId;
  final int locationId;
  final int cityId;
  final int countryId;
  final String name;
  final String image;
  final String taxName;
  final String imageUrl;
  final Location location;
  final City city;
  final Country country;

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

  factory HotelSetting.fromJson(Map<String, dynamic> json) {
    return HotelSetting(
      id: json['id'],
      ownerId: json['owner_id'],
      locationId: json['location_id'],
      cityId: json['city_id'],
      countryId: json['country_id'],
      name: json['name'],
      image: json['image'],
      taxName: json['tax_name'],
      imageUrl: json['image_url'],
      location: Location.fromJson(json['location']),
      city: City.fromJson(json['city']),
      country: Country.fromJson(json['country']),
    );
  }
}

class Location {
  final int id;
  final int cityId;
  final String name;

  Location({
    required this.id,
    required this.cityId,
    required this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      cityId: json['city_id'],
      name: json['name'],
    );
  }
}

class City {
  final int id;
  final int countryId;
  final String name;
  final String image;
  final int isPopular;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;

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

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      countryId: json['country_id'],
      name: json['name'],
      image: json['image'],
      isPopular: json['is_popular'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['image_url'],
    );
  }
}

class Country {
  final int id;
  final String name;
  final String code;
  final String dialCode;
  final int status;
  final String createdAt;
  final String updatedAt;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.dialCode,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      dialCode: json['dial_code'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
class BookedRoom {
  final int id;
  final int bookingId;
  final int roomTypeId;
  final int roomId;
  final String roomNumber;
  final String bookedFor;
  final String fare;
  final String discount;
  final String taxCharge;
  final String cancellationFee;
  final int status;
  final String createdAt;
  final String updatedAt;
  final Room room;
  final RoomType roomType;

  BookedRoom({
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
    required this.room,
    required this.roomType,
  });

  factory BookedRoom.fromJson(Map<String, dynamic> json) {
    return BookedRoom(
      id: json['id'],
      bookingId: json['booking_id'],
      roomTypeId: json['room_type_id'],
      roomId: json['room_id'],
      roomNumber: json['room_number'],
      bookedFor: json['booked_for'],
      fare: json['fare'],
      discount: json['discount'],
      taxCharge: json['tax_charge'],
      cancellationFee: json['cancellation_fee'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      room: Room.fromJson(json['room']),
      roomType: RoomType.fromJson(json['room_type']),
    );
  }
}

class Room {
  final int id;
  final String roomNumber;
  final String createdAt;
  final String updatedAt;

  Room({
    required this.id,
    required this.roomNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      roomNumber: json['room_number'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class RoomType {
  final int id;
  final int ownerId;
  final String title;
  final int numberOfRooms;
  final String defaultFare;
  final int maxAdult;
  final int maxChild;
  final String image;
  final String createdAt;
  final String updatedAt;
  final List<Image> images;

  RoomType({
    required this.id,
    required this.ownerId,
    required this.title,
    required this.numberOfRooms,
    required this.defaultFare,
    required this.maxAdult,
    required this.maxChild,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
      id: json['id'],
      ownerId: json['owner_id'],
      title: json['title'],
      numberOfRooms: json['number_of_rooms'],
      defaultFare: json['default_fare'],
      maxAdult: json['max_adult'],
      maxChild: json['max_child'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      images: (json['images'] as List).map((i) => Image.fromJson(i)).toList(),
    );
  }
}

class Image {
  final String url;

  Image({required this.url});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json['url'],
    );
  }
}

class PaymentInfo {
  final double subtotal;
  final double totalAmount;
  final double canceledFare;
  final double canceledTaxCharge;
  final double paymentReceived;
  final double refunded;

  PaymentInfo({
    required this.subtotal,
    required this.totalAmount,
    required this.canceledFare,
    required this.canceledTaxCharge,
    required this.paymentReceived,
    required this.refunded,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) {
    return PaymentInfo(
      subtotal: json['subtotal'].toDouble(),
      totalAmount: json['total_amount'].toDouble(),
      canceledFare: json['canceled_fare'].toDouble(),
      canceledTaxCharge: json['canceled_tax_charge'].toDouble(),
      paymentReceived: json['payment_received'].toDouble(),
      refunded: json['refunded'].toDouble(),
    );
  }
}


