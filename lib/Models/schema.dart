import 'package:powersync/powersync.dart';

const schema = Schema([
  Table('users', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('prenom'),
    Column.text('email'),
    Column.text('password'),
    Column.text('telephone'),
    Column.text('im_profil'),
    Column.text('user_type'),
    Column.text('bucket_id')
  ]),
  Table('abonnement', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('image'),
    Column.text('prix')
  ]),
  Table('fonctionnalite', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('abonnement_id')
  ]),
  Table('global_files', [
    Column.text('created_at'),
    Column.text('name'),
    Column.text('size'),
    Column.text('extension'),
    Column.text('path')
  ]),
  Table('terv', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('image'),
    Column.text('description'),
    Column.text('phobies'),
    Column.text('plan'),
    Column.text('prix'),
    Column.text('reserve'),
    Column.text('type_vr')
  ]),
  Table('terv_niveau', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('rang'),
    Column.text('description'),
    Column.text('plan'),
    Column.text('image'),
    Column.text('terv_id')
  ]),
  Table('terv_exp', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('exp_link'),
    Column.text('vr_type'),
    Column.text('image'),
    Column.text('terv_niv_id')
  ]),
  Table('analyse_fonctionnelle', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table('fait', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('type'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table('formulaire', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('inclusion'),
    Column.text('modele'),
    Column.text('asm_id'),
    Column.text('is_global'),
    Column.text('default')
  ]),
  Table('variables', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('type'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table('quote', [
    Column.text('created_at'),
    Column.text('citation'),
    Column.text('auteur'),
    Column.text('image'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table('rorsharch', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('im'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table('simple_test', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('modele'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table('strategie_therapeutique', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table('trame_anamnese', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('modele'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table('type_suivi', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table('achat_terv', [
    Column.text('created_at'),
    Column.text('terv_id'),
    Column.text('acheteur_id')
  ]),
  Table('terv_exp_patient', [
    Column.text('created_at'),
    Column.text('terv_exp_id'),
    Column.text('terv_suivi_id'),
    Column.text('commentaire'),
    Column.text('score'),
    Column.text('asm_id'),
    Column.text('user_id')
  ]),
  Table('asm', [
    Column.text('created_at'),
    Column.text('email_objet'),
    Column.text('email_message'),
    Column.text('sauv_donnees'),
    Column.text('sauv_patient_donnees'),
    Column.text('abonnement'),
    Column.text('fin_abonnement')
  ]),
  Table('probleme_files', [
    Column.text('created_at'),
    Column.text('commentaire'),
    Column.text('probleme_id'),
    Column.text('patient_id'),
    Column.text('asm_id'),
    Column.text('file_id')
  ]),
  Table('my_files', [
    Column.text('created_at'),
    Column.text('name'),
    Column.text('size'),
    Column.text('extension'),
    Column.text('path'),
    Column.text('user_id')
  ]),
  Table('patient', [
    Column.text('created_at'),
    Column.text('num_dossier'),
    Column.text('ordre_naissance_pere'),
    Column.text('ordre_naissance_mere'),
    Column.text('brouillon'),
    Column.text('antecedent_juridique'),
    Column.text('antecedent_naissance'),
    Column.text('antecedent_enfance'),
    Column.text('antecedent_adolescence'),
    Column.text('antecedent_adulte'),
    Column.text('asm_id'),
    Column.text('user_id'),
    Column.text('statut')
  ]),
  Table('terv_suivi', [
    Column.text('created_at'),
    Column.text('terv_id'),
    Column.text('asm_id'),
    Column.text('probleme_id'),
    Column.text('user_id'),
    Column.text('patient_id')
  ]),
  Table('terv_suivi_niveau_interdit', [
    Column.text('created_at'),
    Column.text('terv_niv_id'),
    Column.text('terv_suivi_id'),
    Column.text('asm_id'),
    Column.text('user_id')
  ]),
  Table('couple', [
    Column.text('created_at'),
    Column.text('nbre_enfant'),
    Column.text('situation_matrimoniale'),
    Column.text('model_matrimonial'),
    Column.text('commentaire'),
    Column.text('patient_id'),
    Column.text('asm_id'),
    Column.text('conjoint_id')
  ]),
  Table('fait_patient', [
    Column.text('created_at'),
    Column.text('fait_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table('formulaire_patient', [
    Column.text('created_at'),
    Column.text('contenu'),
    Column.text('formulaire_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table('loisir_patient', [
    Column.text('created_at'),
    Column.text('loisir_id'),
    Column.text('asm_id'),
    Column.text('patient_id')
  ]),
  Table('personne', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('im_profil'),
    Column.text('genre'),
    Column.text('email'),
    Column.text('tel'),
    Column.text('addresse'),
    Column.text('ethnie'),
    Column.text('date_naissance'),
    Column.text('lieu_naissance'),
    Column.text('religion'),
    Column.text('condition_residence'),
    Column.text('niv_etude'),
    Column.text('profession'),
    Column.text('situation_matrimoniale'),
    Column.text('qualites'),
    Column.text('defauts'),
    Column.text('commentaire'),
    Column.text('asm_id')
  ]),
  Table('relation', [
    Column.text('created_at'),
    Column.text('lien'),
    Column.text('patient_id'),
    Column.text('personne_relation_id'),
    Column.text('asm_id')
  ]),
  Table('rorsharch_patient', [
    Column.text('created_at'),
    Column.text('resultat'),
    Column.text('rorsharch_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table('seance', [
    Column.text('created_at'),
    Column.text('h_debut'),
    Column.text('h_fin'),
    Column.text('date_seance'),
    Column.text('activites_eff'),
    Column.text('h_debut_f'),
    Column.text('h_fin_f'),
    Column.text('date_seance_f'),
    Column.text('activites_f'),
    Column.text('probleme_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table('simple_test_patient', [
    Column.text('created_at'),
    Column.text('resultat'),
    Column.text('test_id'),
    Column.text('pastient_id'),
    Column.text('asm_id')
  ]),
  Table('patient_type_fait_autre', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('type_fait'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table('patient_type_fait_commentaire', [
    Column.text('created_at'),
    Column.text('commentaire'),
    Column.text('type_fait_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),

  //**********************************************************************************************************************************************
  //**********************************************************************************************************************************************
  //**********************************************************************************************************************************************
  //**********************************************************************************************************************************************
  // LOCAL ONLY TABLE

  Table.localOnly('local_users', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('prenom'),
    Column.text('email'),
    Column.text('password'),
    Column.text('telephone'),
    Column.text('im_profil'),
    Column.text('user_type'),
    Column.text('bucket_id'),
    Column.text('is_local_user'),
    Column.text('validate_status'),
  ]),
  Table.localOnly('local_abonnement', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('image'),
    Column.text('prix')
  ]),
  Table.localOnly('local_fonctionnalite', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('abonnement_id')
  ]),
  Table.localOnly('local_global_files', [
    Column.text('created_at'),
    Column.text('name'),
    Column.text('size'),
    Column.text('extension'),
    Column.text('path')
  ]),
  Table.localOnly('local_terv', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('image'),
    Column.text('description'),
    Column.text('phobies'),
    Column.text('plan'),
    Column.text('prix'),
    Column.text('reserve'),
    Column.text('type_vr')
  ]),
  Table.localOnly('local_terv_niveau', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('rang'),
    Column.text('description'),
    Column.text('plan'),
    Column.text('image'),
    Column.text('terv_id')
  ]),
  Table.localOnly('local_terv_exp', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('exp_link'),
    Column.text('vr_type'),
    Column.text('image'),
    Column.text('terv_niv_id')
  ]),

  Table.localOnly('local_analyse_fonctionnelle', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table.localOnly('local_fait', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('type'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table.localOnly('local_formulaire', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('inclusion'),
    Column.text('modele'),
    Column.text('asm_id'),
    Column.text('is_global'),
    Column.text('default')
  ]),
  Table.localOnly('local_variables', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('type'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table.localOnly('local_quote', [
    Column.text('created_at'),
    Column.text('citation'),
    Column.text('auteur'),
    Column.text('image'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table.localOnly('rorsharch', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('im'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table.localOnly('local_simple_test', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('modele'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table.localOnly('local_strategie_therapeutique', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table.localOnly('local_trame_anamnese', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('modele'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table.localOnly('local_type_suivi', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('description'),
    Column.text('asm_id'),
    Column.text('is_global')
  ]),
  Table.localOnly('local_achat_terv', [
    Column.text('created_at'),
    Column.text('terv_id'),
    Column.text('acheteur_id')
  ]),
  Table.localOnly('local_terv_exp_patient', [
    Column.text('created_at'),
    Column.text('terv_exp_id'),
    Column.text('terv_suivi_id'),
    Column.text('commentaire'),
    Column.text('score'),
    Column.text('asm_id'),
    Column.text('user_id')
  ]),
  Table.localOnly('local_asm', [
    Column.text('created_at'),
    Column.text('email_objet'),
    Column.text('email_message'),
    Column.text('sauv_donnees'),
    Column.text('sauv_patient_donnees'),
    Column.text('abonnement'),
    Column.text('fin_abonnement')
  ]),
  Table.localOnly('local_probleme_files', [
    Column.text('created_at'),
    Column.text('commentaire'),
    Column.text('probleme_id'),
    Column.text('patient_id'),
    Column.text('asm_id'),
    Column.text('file_id')
  ]),
  Table.localOnly('local_my_files', [
    Column.text('created_at'),
    Column.text('name'),
    Column.text('size'),
    Column.text('extension'),
    Column.text('path'),
    Column.text('user_id')
  ]),
  Table.localOnly('local_patient', [
    Column.text('created_at'),
    Column.text('num_dossier'),
    Column.text('ordre_naissance_pere'),
    Column.text('ordre_naissance_mere'),
    Column.text('brouillon'),
    Column.text('antecedent_juridique'),
    Column.text('antecedent_naissance'),
    Column.text('antecedent_enfance'),
    Column.text('antecedent_adolescence'),
    Column.text('antecedent_adulte'),
    Column.text('asm_id'),
    Column.text('user_id'),
    Column.text('statut')
  ]),
  Table.localOnly('local_terv_suivi', [
    Column.text('created_at'),
    Column.text('terv_id'),
    Column.text('asm_id'),
    Column.text('probleme_id'),
    Column.text('user_id'),
    Column.text('patient_id')
  ]),
  Table.localOnly('local_terv_suivi_niveau_interdit', [
    Column.text('created_at'),
    Column.text('terv_niv_id'),
    Column.text('terv_suivi_id'),
    Column.text('asm_id'),
    Column.text('user_id')
  ]),
  Table.localOnly('local_couple', [
    Column.text('created_at'),
    Column.text('nbre_enfant'),
    Column.text('situation_matrimoniale'),
    Column.text('model_matrimonial'),
    Column.text('commentaire'),
    Column.text('patient_id'),
    Column.text('asm_id'),
    Column.text('conjoint_id')
  ]),
  Table.localOnly('local_fait_patient', [
    Column.text('created_at'),
    Column.text('fait_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table.localOnly('local_formulaire_patient', [
    Column.text('created_at'),
    Column.text('contenu'),
    Column.text('formulaire_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table.localOnly('local_loisir_patient', [
    Column.text('created_at'),
    Column.text('loisir_id'),
    Column.text('asm_id'),
    Column.text('patient_id')
  ]),
  Table.localOnly('local_personne', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('im_profil'),
    Column.text('genre'),
    Column.text('email'),
    Column.text('tel'),
    Column.text('addresse'),
    Column.text('ethnie'),
    Column.text('date_naissance'),
    Column.text('lieu_naissance'),
    Column.text('religion'),
    Column.text('condition_residence'),
    Column.text('niv_etude'),
    Column.text('profession'),
    Column.text('situation_matrimoniale'),
    Column.text('qualites'),
    Column.text('defauts'),
    Column.text('commentaire'),
    Column.text('asm_id')
  ]),
  Table.localOnly('local_relation', [
    Column.text('created_at'),
    Column.text('lien'),
    Column.text('patient_id'),
    Column.text('personne_relation_id'),
    Column.text('asm_id')
  ]),
  Table.localOnly('local_rorsharch_patient', [
    Column.text('created_at'),
    Column.text('resultat'),
    Column.text('rorsharch_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table.localOnly('local_seance', [
    Column.text('created_at'),
    Column.text('h_debut'),
    Column.text('h_fin'),
    Column.text('date_seance'),
    Column.text('activites_eff'),
    Column.text('h_debut_f'),
    Column.text('h_fin_f'),
    Column.text('date_seance_f'),
    Column.text('activites_f'),
    Column.text('probleme_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table.localOnly('local_simple_test_patient', [
    Column.text('created_at'),
    Column.text('resultat'),
    Column.text('test_id'),
    Column.text('pastient_id'),
    Column.text('asm_id')
  ]),
  Table.localOnly('local_patient_type_fait_autre', [
    Column.text('created_at'),
    Column.text('nom'),
    Column.text('type_fait'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),
  Table.localOnly('local_patient_type_fait_commentaire', [
    Column.text('created_at'),
    Column.text('commentaire'),
    Column.text('type_fait_id'),
    Column.text('patient_id'),
    Column.text('asm_id')
  ]),

  /////////////////////////////////////////////////////////////////////////////////
  Table.localOnly('file_manager', [
    Column.text('id'),
    Column.text('online_file'),
    Column.text('offline_file'),
  ]),


]);
