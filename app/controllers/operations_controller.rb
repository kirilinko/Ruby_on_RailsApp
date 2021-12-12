class OperationsController < ApplicationController
  before_action :verification

  def index
  end

  def ajouter
    @operation=Operation.new
  end
 def create
 
  operation=Operation.create(operation_params)
  if operation.save
  
      @utilisateur=Utilisateur.find(session[:id_session]) 
       if operation.type_operation=="Entrer"
        current_entrer=@utilisateur.ttenter
        total_entre=current_entrer+operation.montant
        @utilisateur.update(ttenter: total_entre)
        utilisateurs_inscription_path
        redirect_to utilisateurs_profil_path , message: "Entré correctement enrégistré"
      else
        current_sortie=@utilisateur.ttsortit
        total_sorties=current_sortie+operation.montant
        @utilisateur.update(ttsortit: total_sorties)
        redirect_to utilisateurs_profil_path , message: "Dépense correctement enrégistré"
     end

  else
     
      redirect_to operations_ajouter_path, message:"Vous devez remplir tous les champs"

  end

end

  def modifier
    @operation=Operation.find(params[:id])
  end

  def update
    operation=Operation.find(params[:id])
    old_montant=operation.montant
    operation.update(operation_params)

    if operation.save
  
      @utilisateur=Utilisateur.find(session[:id_session]) 
       if operation.type_operation=="Entrer"
        current_entrer=@utilisateur.ttenter-old_montant
        total_entre=current_entrer+operation.montant
        @utilisateur.update(ttenter: total_entre)
        utilisateurs_inscription_path
        redirect_to utilisateurs_profil_path , message: "Entré correctement mis à jour"
      else
        current_sortie=@utilisateur.ttsortit-old_montant
        total_sorties=current_sortie+operation.montant
        @utilisateur.update(ttsortit: total_sorties)
        redirect_to utilisateurs_profil_path , message: "Dépense correctement mis à jour"
     end

  else
     
      redirect_to operation_modifier_path, message:"Vous devez remplir tous les champs"

  end
  end
 
 def destroy
     @operation=Operation.find(params[:id])
     @utilisateur=Utilisateur.find(session[:id_session])

     if @operation.type_operation=="Entrer"
        current_entrer=@utilisateur.ttenter
        total_entre=current_entrer-@operation.montant
        @utilisateur.update(ttenter: total_entre)
        utilisateurs_inscription_path
        @operation.destroy
        redirect_to utilisateurs_profil_path , message: "opération type Entré supprimer"
      else
        current_sortie=@utilisateur.ttsortit
        total_sorties=current_sortie-@operation.montant
        @utilisateur.update(ttsortit: total_sorties)
        @operation.destroy
        redirect_to utilisateurs_profil_path , message: "opération type Sortie supprimer"
     end

      
 end




end


private

def verification
    if session[:id_session].blank?
      redirect_to utilisateurs_index_path, danger: "Acune seesion active. Veillez vous connetez"
    end
end

def operation_params
   params.require(:operation).permit(:montant, :type_operation, :motif, :ladate, :utilisateur_id)
end