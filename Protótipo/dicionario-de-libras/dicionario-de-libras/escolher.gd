extends Window

var modo : String

func _ready() -> void:
	for i in get_parent().sinais:
		var button = Button.new()
		button.text = i.palavra
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.name = i.palavra
		%Palavras_escolha.add_child(button)
		if modo == "remover":
			button.pressed.connect(func(): 
				get_parent().sinais.erase(i)
				get_parent().update()
				queue_free()
				)
		elif modo == "alterar":
			button.pressed.connect(func(): 
				get_parent()._on_adicionar_sinal_pressed() 
				get_parent().get_node("Adicionar").modo = "alterar"
				get_parent().get_node("Adicionar").n = i
				get_parent().get_node("Adicionar").mostrar()
				queue_free()
				)

func _on_buscar_pressed() -> void:
	var palavra = %Palavra_escolha.text.to_upper()
	for i in %Palavras_escolha.get_children():
		if i.name.contains(palavra):
			i.show()
		else: i.hide()


func _on_close_requested() -> void:
	queue_free()
