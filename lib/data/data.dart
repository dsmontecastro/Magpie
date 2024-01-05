class Data {
  final String name;
  final String code;
  final String logo;
  final int profit22;
  final int profit23;

  const Data({
    required this.name,
    required this.code,
    required this.logo,
    required this.profit22,
    required this.profit23,
  });

  Data.fromJSON(Map<String, dynamic> json)
      : name = json['bank_name'] ?? '-',
        code = json['bank_code'] ?? '-',
        logo = json['logo_url'] ?? '-',
        profit22 = json['profits']['2022'] ?? -1,
        profit23 = json['profits']['2023'] ?? -1;
}
