import 'dart:convert';

List<EmployeModel> employeFromJson(String str)=>List<EmployeModel>.from(json.decode(str).map((x)=>EmployeModel.fromJson(Map<String,dynamic>.from(x))));
class EmployeModel {
  String? id;
  String? name;
  String? nip;
  String? division;
  String? level;
  String? pob;
  String? bod;
  String? phone;
  String? email;
  String? address;
  String? photo;

  EmployeModel(
      {this.id,
        this.name,
      this.nip,
      this.division,
      this.level,
      this.pob,
      this.bod,
      this.phone,
      this.email,
      this.address,
      this.photo});

  EmployeModel.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name = json['name'];
    nip = json['nip'];
    division = json['division'];
    level = json['level'];
    pob = json['pob'];
    bod = json['bod'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']=this.id;
    data['name'] = this.name;
    data['nip'] = this.nip;
    data['division'] = this.division;
    data['level'] = this.level;
    data['pob'] = this.pob;
    data['bod'] = this.bod;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['photo'] = this.photo;
    return data;
  }
}
