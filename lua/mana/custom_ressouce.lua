-- lua/autorun/server/custom_resources.lua

if SERVER then
    print("[ResourceAdder] Chargement des ressources personnalisées pour les clients...")

    -- Ajout de la police personnalisée
    local fontPath = "resource/fonts/Breadcumz.otf"
    if file.Exists(fontPath, "GAME") then -- Vérifie si le fichier existe dans le dossier du jeu/serveur
        resource.AddFile(fontPath)
        print("[ResourceAdder] Police '" .. fontPath .. "' ajoutée aux téléchargements clients.")
    else
        print("[ResourceAdder] ERREUR: Fichier de police '" .. fontPath .. "' NON TROUVÉ ! Assurez-vous qu'il est au bon endroit.")
    end

    -- Vous pouvez ajouter d'autres resource.AddFile ici pour des sons, matériaux, modèles, etc.
end