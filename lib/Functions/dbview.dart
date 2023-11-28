/*
Abonnement(id,created_at,nom, image, prix);
Achat_terv(id,created_at,terv_id,acheteur_id);
Analyse_fonctionnelle(id,created_at, nom, description, asm_id, is_global);
Asm(id,created_at, email_objet, email_message, sauv_donnees, sauv_patient_donnees, abonnement, fin_abonnement);
Fait(id, created_at,type, nom, asm_id, is_global});
Fait_patient({id,created_at, fait_id, patient_id, asm_id});
Fonctionnalite({id,created_at, nom, abonnement_id});
Formulaire({id,created_at, nom, description,inclusion,modele, asm_id,is_global});
Formulaire_patient({id,created_at, contenu, formulaire_id, patient_id,asm_id});
Global_files(id,created_at, name,size, extension, path});
Loisir_patient(id,created_at, loisir_id, asm_id,patient_id});
My_files(id, created_at,name, size, extension, path,user_id});
Patient({id,created_at, num_dossier, ordre_naissance_pere,ordre_naissance_mere, brouillon,antecedent_juridique, antecedent_naissance,antecedent_enfance, antecedent_adolescence, antecedent_adulte, asm_id, user_id,statut});
Patient_type_fait_autre(id,created_at,nom, type_fait, patient_id,asm_id});
Patient_type_fait_commentaire(id, created_at,commentaire, type_fait_id, patient_id, asm_id});
Personne(id, created_at,nom, im_profil,genre, email,tel, addresse, ethnie, date_naissance, lieu_naissance, religion, condition_residence, niv_etude, profession, situation_matrimoniale, qualites,defauts,commentaire, asm_id});
Probleme_files(id, created_at,commentaire, probleme_id, patient_id, asm_id, file_id});
Quote(id, created_at,citation , auteur, image, asm_id,is_global});
Relation(id,created_at, lien,patient_id, personne_relation_id,asm_id});
Rorsharch(id,created_at, nom, im,asm_id, is_global});
Rorsharch_patient({id,created_at,resultat,rorsharch_id, patient_id, asm_id});
Seance(id,created_at, h_debut,h_fin, date_seance, activites_eff, h_debut_f,h_fin_f, date_seance_f,activites_f,probleme_id, patient_id, asm_id});
Simple_test({id,created_at, nom, modele, asm_id, is_global});
Simple_test_patient({id,created_at,resultat, test_id, pastient_id, asm_id});
Strategie_therapeutique(id,created_at, nom, description, asm_id, is_global});
Terv({id,created_at, nom,image, description, phobies,plan, prix, reserve});
Terv_exp(id,created_at,nom, description,exp_link, vr_type, image, terv_niv_id});
Terv_exp_patient({id,created_at, terv_exp_id, terv_suivi_id, commentaire,score, asm_id, User_id});
Terv_niveau({id,created_at, nom, rang, description,plan, image,terv_id});
Terv_suivi(id,created_at, terv_id,asm_id,probleme_id, user_id, patient_id});
Terv_suivi_niveau_interdit(id,created_at,terv_niv_id, terv_suivi_id,asm_id, user_id});
Trame_anamnese(id,created_at, nom,description, modele, asm_id,is_global});
Type_suivi(id,created_at, nom, description, asm_id,is_global});
Users(id,created_at,nom, prenom, email,password, telephone, im_profil, user_type, bucket_id});
Off_Users(id,created_at,nom, prenom, email,password, telephone, im_profil, user_type, bucket_id,is_local_user,validate_status});
Varibales({id,created_at, nom,type, asm_id, is_global});
couple({id,created_at,nbre_enfant,situation_matrimoniale,model_matrimonial,commentaire,patient_id,asm_id,conjoint_id')}),
*/


