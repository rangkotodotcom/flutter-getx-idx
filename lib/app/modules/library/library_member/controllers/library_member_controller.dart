import 'package:get/get.dart';

class LibraryMemberController extends GetxController {
  Future<LibraryMemberModel> getMemberData() async {
    await Future.delayed(const Duration(seconds: 2));

    return LibraryMemberModel(
        memberCode: "memberCode",
        name: "name",
        numberName: "numberName",
        numberId: "numberId",
        yearIn: 2020,
        yearOut: 2024,
        status: 1,
        statusStr: "statusStr");
  }
}

class LibraryMemberModel {
  String memberCode, name, numberName, numberId, statusStr;
  int yearIn, yearOut, status;

  LibraryMemberModel({
    required this.memberCode,
    required this.name,
    required this.numberName,
    required this.numberId,
    required this.yearIn,
    required this.yearOut,
    required this.status,
    required this.statusStr,
  });

  factory LibraryMemberModel.fromJson(Map<String, dynamic> json) {
    return LibraryMemberModel(
      memberCode: json['member_code'],
      name: json['name'],
      numberName: json['number_name'],
      numberId: json['number_id'],
      yearIn: json['year_in'],
      yearOut: json['year_out'],
      status: json['status'],
      statusStr: json['status_str'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_code'] = memberCode;
    data['name'] = name;
    data['number_name'] = numberName;
    data['number_id'] = numberId;
    data['year_in'] = yearIn;
    data['year_out'] = yearOut;
    data['status'] = status;
    data['status_str'] = statusStr;
    return data;
  }
}
