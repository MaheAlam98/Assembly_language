.model small
.stack 100h

.data
str1 db "Enter an uppercase letter: $"
str2 db 13,10,"The lowercase letter is: $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Display the prompt to enter an uppercase letter
    lea dx, str1
    mov ah, 9
    int 21h
    
    ; Read the uppercase letter
    mov ah, 1
    int 21h
    mov bl, al   ; Store the letter in BL
    
    ; Convert to lowercase
    sub bl, 'A'  ; Convert ASCII to 0-25 range
    add bl, 'a'  ; Convert to lowercase ASCII
    
    ; Display the result prompt
    lea dx, str2
    mov ah, 9
    int 21h
    
    ; Display the lowercase letter
    mov dl, bl
    mov ah, 2
    int 21h
    
    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end