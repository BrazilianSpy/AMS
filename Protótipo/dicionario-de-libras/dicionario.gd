extends Control

var sinais : Array[String] = ["A", "ABACATE", "ABAFAR", "AMAR", "APOIO", "B", "BANANA", "C", "CANELA", "D", "DOMAR", "M", "MAR", "MARINHEIRO", "MELÃO"]

func _ready() -> void:
	var file = FileAccess.open("dados.txt",FileAccess.READ)
	
	#sinais = str_to_var(file.get_as_text())
	file.close()
	for i in sinais:
		var button = Button.new()
		button.text = i
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.name = i
		%Palavras.add_child(button)

func _on_buscar_pressed() -> void:
	var palavra = %Palavra.text.to_upper()
	if %Numero.text != "":
		for i in %Palavras.get_children():
			i.hide()
		%Palavras.get_node(sinais[int(%Numero.text)]).show()
	for i in %Palavras.get_children():
		if i.name.contains(palavra):
			i.show()
		else: i.hide()
		
