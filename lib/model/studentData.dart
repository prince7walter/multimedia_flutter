class student_data {
  List<Listes> listes;

  student_data({this.listes});

  student_data.fromJson(Map<String, dynamic> json) {
    if (json['listes'] != null) {
      listes = new List<Listes>();
      json['listes'].forEach((v) {
        listes.add(new Listes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listes != null) {
      data['listes'] = this.listes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listes {
  int idPers;
  String nom;
  String prenom;
  String matricule;
  String idClasse;
  String email;
  String contact;
  String idUser;
  String createdAt;
  String updatedAt;

  Listes(
      {this.idPers,
        this.nom,
        this.prenom,
        this.matricule,
        this.idClasse,
        this.email,
        this.contact,
        this.idUser,
        this.createdAt,
        this.updatedAt});

  Listes.fromJson(Map<String, dynamic> json) {
    idPers = json['id_pers'];
    nom = json['nom'];
    prenom = json['prenom'];
    matricule = json['matricule'];
    idClasse = json['id_classe'];
    email = json['email'];
    contact = json['contact'];
    idUser = json['id_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pers'] = this.idPers;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['matricule'] = this.matricule;
    data['id_classe'] = this.idClasse;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['id_user'] = this.idUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}