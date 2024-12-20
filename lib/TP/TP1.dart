class Matiere{

  String? libelle;
  List<double> notes = [];

  Matiere({ required this.libelle, required this.notes});


  double calculMoyeneMatiere(){
    double somme = notes.fold(0.0, (prev, note) => prev + note);
    return somme / notes.length;
  }

}

void main(){

  List<Matiere> matieres =  [] ;
  Matiere francais = Matiere(libelle: "Français", notes: [2.7, 7.9, 4.6, 5.9]);
  Matiere math = Matiere(libelle: "Math", notes:  [8.7, 7.1, 2.7, 7.9]);
  Matiere informatique = Matiere(libelle: "Informatique", notes: [4.6, 5.9, 4.6, 5.9]);
  matieres.add(francais);
  matieres.add(math);
  matieres.add(informatique);

  double sommeDesMoyennes = 0.0;
  for (var matiere in matieres) {
    double moyenneMatiere = matiere.calculMoyeneMatiere();
    print("La moyenne en ${matiere.libelle} est de ${moyenneMatiere}");
    sommeDesMoyennes += moyenneMatiere;
  }
  print("");
  print("La moyenne générale est de ${sommeDesMoyennes / matieres.length}");

}