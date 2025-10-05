-- Génère le diagramme de Gantt
-- Aller au bas du fichier pour définir les lignes correspondant à chaque tâche
function ligne_objectif(min, max, color, objectif, nom)
	tex.print(objectif .. " & ")
	tex.print(nom)
	for i=1,60 do
	  tex.print(" & ")
	  if i >= min and i <= max then
		tex.print("\\cellcolor{" .. color .. "}")
	  end
	end
	tex.print(" \\\\")
	tex.print("")
	tex.print("\\hline")
	tex.print("")
end

tex.print("\\renewcommand{\\arraystretch}{2}")
tex.print("")
tex.print("\\begin{tabular}{|")
tex.print("c|c|")
for i=1,60 do
  tex.print("x|")
end
tex.print("}")
tex.print("")
tex.print("\\hline")
tex.print("")
-- top header
tex.print("\\multicolumn{2}{|c}{}")
for i=1,5 do
  tex.print(" & \\multicolumn{12}{|c|}{\\textbf{Année " .. i .. "}}")
end
tex.print(" \\\\")
tex.print("\\hline")

-- months row
tex.print("\\multicolumn{2}{|r|}{\\textbf{Mois}}")
for i=1,5 do
  for j=1,12 do
    tex.print(" & \\tiny{" .. j .. "}")
  end
end
tex.print(" \\\\")
tex.print("\\hline")

-- instruction spanning the 60 month columns
tex.print("\\textbf{Sous-objectifs} & \\textbf{Stagiaire(s)}"
  .. " & \\multicolumn{60}{c|}{\\textit{Insérez un \\og{}x\\fg{} dans le ou les mois prévus ou surlignez la case.}} \\\\")
tex.print("\\hline")
tex.print("")

-- Chaque appel à ligne_objectif() produit une ligne du tableau.
-- - Les deux premiers arguments sont l'index de la case de début et
--   de fin de l'intervalle à colorier dans le tableau. La case 1
--   correspond au mois 1 de l'année 1, et la case 60 est le mois 12
--   de l'année 5. Passer -1 aux deux arguments ne produit aucun
--   coloriage.
-- - L'argument suivant est la couleur du coloriage. Tous les noms
--   de [x11names]{xcolor} sont permis.
-- - Les deux derniers arguments sont le texte du sous-objectif et
--   le nom du stagiaire.
ligne_objectif(3, 10, "blue", "1) Inscrivez le sous-objectif ici", "")
ligne_objectif(-1, -1, "blue", "2) Inscrivez le sous-objectif ici", "")
ligne_objectif(-1, -1, "blue", "3)", "")
ligne_objectif(-1, -1, "blue", "4)", "")
ligne_objectif(-1, -1, "blue", "5)", "")
tex.print("")

tex.print("\\end{tabular}")
tex.print("")
tex.print("\\renewcommand{\\arraystretch}{1.2}")
tex.print("")