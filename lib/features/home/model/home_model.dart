class WidgetModel {
  final int todayBooked;
  final int todayAvailable;
  final int totalRoom;
  final int todayBlocked;
  final int todayCanceledBooking;
  final int todayVoidBooking;
  final int total;
  final int active;
  final int pendingCheckin;
  final int todayCheckout;
  final int delayedCheckout;
  final int upcomingCheckin;
  final int upcomingCheckout;
  final double todayRevenue;
  final double? todayAvgRate;
  final int todayStay;

  WidgetModel({
    required this.todayBooked,
    required this.todayAvailable,
    required this.totalRoom,
    required this.todayBlocked,
    required this.todayCanceledBooking,
    required this.todayVoidBooking,
    required this.total,
    required this.active,
    required this.pendingCheckin,
    required this.todayCheckout,
    required this.delayedCheckout,
    required this.upcomingCheckin,
    required this.upcomingCheckout,
    required this.todayRevenue,
    this.todayAvgRate,
    required this.todayStay,
  });

  factory WidgetModel.fromJson(Map<String, dynamic> json) {
    return WidgetModel(
      todayBooked: json['today_booked'] ?? 0,
      todayAvailable: json['today_available'] ?? 0,
      totalRoom: json['total_room'] ?? 0,
      todayBlocked: json['today_blocked'] ?? 0,
      todayCanceledBooking: json['today_canceled_booking'] ?? 0,
      todayVoidBooking: json['today_void_booking'] ?? 0,
      total: json['total'] ?? 0,
      active: json['active'] ?? 0,
      pendingCheckin: json['pending_checkin'] ?? 0,
      todayCheckout: json['today_checkout'] ?? 0,
      delayedCheckout: json['delayed_checkout'] ?? 0,
      upcomingCheckin: json['upcoming_checkin'] ?? 0,
      upcomingCheckout: json['upcoming_checkout'] ?? 0,
      todayRevenue: double.parse(json['today_revenue'].toString()),
      todayAvgRate: json['today_avg_rate'] != null ? double.parse(json['today_avg_rate'].toString()) : null,
      todayStay: json['today_stay'] ?? 0,
    );
  }
}

class BookingMonthModel {
  final double bookingAmount;
  final String month;

  BookingMonthModel({
    required this.bookingAmount,
    required this.month,
  });

  factory BookingMonthModel.fromJson(Map<String, dynamic> json) {
    return BookingMonthModel(
      bookingAmount: double.parse(json['bookingAmount']),
      month: json['months'] ?? '',
    );
  }
}

class DashboardModel {
  final String pageTitle;
  final WidgetModel widget;
  final List<BookingMonthModel> bookingMonth;
  final List<String> months;
  final double totalRevenue;
  final double dailyAvgRate;
  final double avgLeadTime;
  final double avgLengthOfStay;
  final Map<String, double> avgMonthlyLeadTime;
  final Map<String, double> avgMonthlyLengthOfStay;

  DashboardModel({
    required this.pageTitle,
    required this.widget,
    required this.bookingMonth,
    required this.months,
    required this.totalRevenue,
    required this.dailyAvgRate,
    required this.avgLeadTime,
    required this.avgLengthOfStay,
    required this.avgMonthlyLeadTime,
    required this.avgMonthlyLengthOfStay,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      pageTitle: json['page_title'] ?? '',
      widget: WidgetModel.fromJson(json['widget']),
      bookingMonth: (json['booking_month'] as List<dynamic>)
          .map((item) => BookingMonthModel.fromJson(item))
          .toList(),
      months: List<String>.from(json['months']),
      totalRevenue: double.parse(json['total_revenue'].toString()),
      dailyAvgRate: double.parse(json['daily_avg_rate'].toString()),
      avgLeadTime: double.parse(json['avg_lead_time'].toString()),
      avgLengthOfStay: double.parse(json['avg_length_of_stay'].toString()),
      avgMonthlyLeadTime: Map<String, double>.from(
          json['avg_monthly_lead_time'].map((key, value) => MapEntry(key, double.parse(value.toString())))),
      avgMonthlyLengthOfStay: Map<String, double>.from(
          json['avg_monthly_length_of_stay'].map((key, value) => MapEntry(key, double.parse(value.toString())))),
    );
  }
}


