class SendOtpRequest {
  SendOtpRequest({
    this.mobileNumber,
    this.type,
    this.countryCode,
    this.message,
    this.status,
  });

  SendOtpRequest.fromJson(dynamic json) {
    mobileNumber = json['mobile_number'];
    type = json['type'];
    countryCode = json['country_code'];
    message = json['message'];
    status = json['status'];
    // code = json['code'];
  }

  String? mobileNumber;
  String? type;
  String? countryCode;
  String? message;
  String? status;

  // String? code;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['country_code'] = countryCode;
    data['type'] = type;
    data['mobile_number'] = mobileNumber;
    // data['message'] = message;
    // data['status'] = status;
    // data['code'] = code;
    return data;
  }
}
