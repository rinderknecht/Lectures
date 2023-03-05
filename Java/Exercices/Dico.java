// Corrig� tr�s d�taill� et inefficace de l'exercice 4 du partiel de
// Java.
// Test:
// $ java Dico  1 3 0 3 3 1 7 7
// elt = 1 3 0 7
// occ = 2 3 1 2

public class Dico {
  // La m�thode `unique_occ' prend un tableau d'entiers et retourne le
  // nombre d'occurrences uniques (c'est-�-dire d'�l�ments non
  // r�p�t�s). Pour cela on parcours le tableau par index
  // croissants. Pour chaque �l�ment on reparcourt le tableau du d�but
  // jusqu'� l'�l�ment courant en d�terminant si cet �l�ment n'a pas
  // d�j� �t� rencontr�. S'il n'a pas �t� d�j� rencontr�, on
  // incr�mente un compteur. Dans tous les cas, on passe alors �
  // l'�l�ment suivant. Il faut donc deux boucles, l'une �tant
  // imbriqu�e dans l'autre.
  public static int unique_occ (int[] t) {
    int n = 0; // Compteur
    int i = 0;
    int j = 0;
    for (i = 0; i < t.length; i++) {
      j = 0; // On repart du d�but � chaque fois.
      while (t[j] != t[i]) j++;
      if (i == j) n++; // t[i] == t[j] et i == j impliquent que t[j]
                       // est nouveau, donc n++.
    }
    return n;
  }

  // La m�thode `strip' prend un tableau d'entiers et retourne un
  // nouveau tableau contenant les m�mes �l�ments dans le m�me ordre
  // mais sans les r�p�titions. 
  public static int[] strip (int[] t) {
    // Il nous faut d'abord d�terminer la taille du tableau
    // r�sultant, car la taille d'un tableau est fixe. Pour cela on
    // appelera la m�thode `unique_occ'.
    int[] elt = new int [unique_occ (t)];
 
    // Maintenant on remplit `t' avec les occurrences uniques. Pour
    // cela on reparcours `t' d'une fa�on identique � celle de
    // `unique_occ', sauf qu'on copie en plus `t[i]' dans `elt[n]'
    // avant d'incr�menter `n'.
    int n = 0;
    int i = 0;
    int j = 0;

    for (i = 0; i < t.length; i++) {
      j = 0; // On repart du d�but � chaque fois.
      while (t[j] != t[i]) j++;
      if (i == j) {
        elt[n] = t[i]; // Ajout par rapport � `unique_occ'.
        n++;
      }
    }
    return elt;
  }

  // La m�thode `count' prend deux tableaux d'entiers, le second
  // (`elt') contenant les �l�ments du premier (`t') non r�p�t�s et
  // dans le m�me ordre. Le tableau r�sultant `occ' est tel que
  // `occ[i]' vaut le nombre d'occurrences de `elt[i]' dans `t'. 
  public static int[] count (int[] t, int[] elt) {
    // Le tableau r�sultant poss�de donc la m�me dimension que
    // `elt'.
    int[] occ = new int [elt.length];

    // Pour le remplir, on parcourt `elt' par index croissants. Pour
    // chaque �l�ment `elt[i]' on parcourt tout le tableau `t' et on
    // compte le nombre de fois o� cet �l�ment appara�t. Puis `occ[i]'
    // prend cette valeur.
    int i = 0;
    int j = 0;
    int n = 0; // Compteur

    for (i = 0; i < elt.length; i++) {
      n = 0;
      for (j = 0; j < t.length; j++)
        if (t[j] == elt[i]) n++;
      occ[i] = n;
    }

    return occ;
  }

  // La m�thode `print' affiche le contenu d'un tableau d'entiers.
  public static void print (int[] t) {
      int i = 0;
      for (i = 0; i < t.length; i++)
	System.out.print (t[i] + " ");  
      System.out.println ();
  }

  public static void main (String[] args) {
      int[] t = new int [args.length];
      int i = 0;
      for (i = 0; i < t.length; i++) 
	  t[i] = Integer.parseInt (args[i]);
      int[] elt = strip (t);
      System.out.print ("elt = ");
      print (elt);
      int[] occ = count (t, elt);
      System.out.print ("occ = ");
      print (occ);
  }
}
