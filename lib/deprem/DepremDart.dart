class Deprem {
  String? github;
  String? warning;
  String? reference;
  List<Earthquakes>? earthquakes;

  Deprem({this.github, this.warning, this.reference, this.earthquakes});

  Deprem.fromJson(Map<String, dynamic> json) {
    github = json['github'];
    warning = json['warning'];
    reference = json['reference'];
    if (json['earthquakes'] != null) {
      earthquakes = <Earthquakes>[];
      json['earthquakes'].forEach((v) {
        earthquakes!.add(new Earthquakes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['github'] = this.github;
    data['warning'] = this.warning;
    data['reference'] = this.reference;
    if (this.earthquakes != null) {
      data['earthquakes'] = this.earthquakes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Earthquakes {
  String? date;
  String? time;
  String? location;
  String? city;
  String? lat;
  String? lng;
  String? mag;
  String? depth;

  Earthquakes(
      {this.date,
        this.time,
        this.location,
        this.city,
        this.lat,
        this.lng,
        this.mag,
        this.depth});

  Earthquakes.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    location = json['location'];
    city = json['city'];
    lat = json['lat'];
    lng = json['lng'];
    mag = json['mag'];
    depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['location'] = this.location;
    data['city'] = this.city;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['mag'] = this.mag;
    data['depth'] = this.depth;
    return data;
  }
}