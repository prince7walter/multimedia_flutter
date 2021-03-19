class inbox_data {
  List<Listes> listes;

  inbox_data({this.listes});

  inbox_data.fromJson(Map<String, dynamic> json) {
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
  int idMesg;
  String object;
  String corps;
  String destinataire;
  String typeMesg;
  String createdAt;
  String updatedAt;
  int idPers;
  String nom;
  String prenom;
  String matricule;
  String idClasse;
  String email;
  String contact;
  String idUser;

  Listes(
      {this.idMesg,
        this.object,
        this.corps,
        this.destinataire,
        this.typeMesg,
        this.createdAt,
        this.updatedAt,
        this.idPers,
        this.nom,
        this.prenom,
        this.matricule,
        this.idClasse,
        this.email,
        this.contact,
        this.idUser});

  Listes.fromJson(Map<String, dynamic> json) {
    idMesg = json['id_mesg'];
    object = json['object'];
    corps = json['corps'];
    destinataire = json['destinataire'];
    typeMesg = json['type_mesg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idPers = json['id_pers'];
    nom = json['nom'];
    prenom = json['prenom'];
    matricule = json['matricule'];
    idClasse = json['id_classe'];
    email = json['email'];
    contact = json['contact'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_mesg'] = this.idMesg;
    data['object'] = this.object;
    data['corps'] = this.corps;
    data['destinataire'] = this.destinataire;
    data['type_mesg'] = this.typeMesg;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id_pers'] = this.idPers;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['matricule'] = this.matricule;
    data['id_classe'] = this.idClasse;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['id_user'] = this.idUser;
    return data;
  }
}