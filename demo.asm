; ������ϵͳ�ؼ���ȫ��ʹ�ô�д
; �Զ����źͱ�����ȫ��ʹ��Сд
; ���ּ�����Ʊ��ȫ��ʹ��Сд
; ʵ����ϵͳ�ؼ��ֺ����ּ�����Ʋ����ִ�Сд
; ���Զ����źͱ�����Ҫ���ִ�Сд
datas SEGMENT
	x DD 23
	y DD -10
	msg DB "Hello ", "$"
	info DB "Input your name: ", "$"
	buf DB 20,0,20 dup("$")
datas ENDS

stacks SEGMENT stack
	DB 128 DUP(0)
stacks ENDS

puts MACRO string ; �궨�壬����ֻ�����ַ������ַ���,���Բ��Ӳ���
	LEA DX, string
	MOV AH, 09h ; ��09h�ƶ���ah�Ĵ���
	INT 21h	; ����dos���ܣ�21hִָ��ah�Ĵ���ָ�����ܣ����dos���ܱ�
ENDM

gets MACRO buff 
	LEA DX, buff
	MOV AH, 0ah
	INT 21h
ENDM

enter MACRO ; ���з�ֹ����
	MOV DL, 0ah ; ���з�   
	MOV AH, 02h
	INT 21h 
ENDM

codes SEGMENT
	ASSUME CS:codes,DS:datas,SS:stacks ;ָ������Σ����ݶΣ���ջ��
start:
	MOV AX, stacks
	MOV SS, AX
	MOV AX, datas
	MOV DS, AX
	puts info
	gets buf
	enter
	puts msg
	puts buf+2
	MOV AH, 4ch
	INT 21h
codes ENDS
	END start