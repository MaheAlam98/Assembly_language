.model small
.stack 100h

.data
str1 db "Enter a lowercase letter: $"
str2 db 13,10,"The uppercase letter is: $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Display the prompt to enter a lowercase letter
    lea dx, str1
    mov ah, 9
    int 21h
    
    ; Read the lowercase letter
    mov ah, 1
    int 21h
    mov bl, al   ; Store the letter in BL
    
    ; Convert to uppercase
    sub bl, 'a'  ; Convert ASCII to 0-25 range
    add bl, 'A'  ; Convert to uppercase ASCII
    
    ; Display the result prompt
    lea dx, str2
    mov ah, 9
    int 21h
    
    ; Display the uppercase letter
    mov dl, bl
    mov ah, 2
    int 21h
    
    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end