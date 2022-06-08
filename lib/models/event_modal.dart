class Event {
  final String name;
  final String clusterName;
  final String type;
  final String desc;
  final String cupName;
  final String r1Date;
  final String r2Date;

  Event(
      {required this.name,
      required this.clusterName,
      required this.type,
      required this.desc,
      required this.cupName,
      required this.r1Date,
      required this.r2Date});
}
