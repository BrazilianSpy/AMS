extends Window

var modo = "adicionar"
var n

func _on_adicionar_pressed() -> void:
	if modo == "alterar":
		alterar()
		return
	var s = sinal.new()
	
	s.palavra = %palavra.text.to_upper()
	s.origem = %origem.text
	s.classe = %classe.text
	s.exemplo = %exemplo.text
	s.exemplo_libras = %exemplo_libras.text
	s.acepcao = %acepcao.text
	s.imagem = %imagem.text
	s.mao = %mao.text
	s.video = %video.text
	s.assunto = %assunto.text
	s.status = false
	
	get_parent().sinais.append(s)
	get_parent().update()
	hide()

func alterar():
	n.palavra = %palavra.text.to_upper()
	n.origem = %origem.text
	n.classe = %classe.text
	n.exemplo = %exemplo.text
	n.exemplo_libras = %exemplo_libras.text
	n.acepcao = %acepcao.text
	n.imagem = %imagem.text
	n.mao = %mao.text
	n.video = %video.text
	n.assunto = %assunto.text
	n.status = false
	modo = "adiconar"
	get_parent().update()
	hide()

func mostrar():
	%palavra.text = n.palavra 
	%origem.text = n.origem 
	%classe.text = n.classe 
	%exemplo.text = n.exemplo  
	%exemplo_libras.text = n.exemplo_libras 
	%acepcao.text = n.acepcao  
	%imagem.text = n.imagem  
	%mao.text = n.mao 
	%video.text = n.video 
	%assunto.text = n.assunto 

func _on_close_requested() -> void:
	hide()
