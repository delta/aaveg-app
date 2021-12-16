// import 'dart:convert';

// List<SponsorResponse> sponsorResponseFromJson(String str) =>
//     List<SponsorResponse>.from(
//         json.decode(str).map((x) => SponsorResponse.fromJson(x)));

// String sponsorResponseToJson(List<SponsorResponse> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class SponsorResponse {
//   SponsorResponse({
//     required this.name,
//     required this.title,
//     required this.logo,
//     required this.link,
//   });

//   String name;
//   String title;
//   String logo;
//   String link;

//   factory SponsorResponse.fromJson(Map<String, dynamic> json) =>
//       SponsorResponse(
//         name: json["name"],
//         title: json["title"],
//         logo: json["logo"],
//         link: json["link"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "title": title,
//         "logo": logo,
//         "link": link,
//       };
// }
