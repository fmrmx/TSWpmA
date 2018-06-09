void WBotEx(float Current_X_Degress_Address,float X_Degress_Address,float Current_Y_Degress_Address,
            float Y_Degress_Address,float Get_If_Aiming_Address,float My_X_Location_Address,float My_Y_Location_Address,
                float My_Z_Location_Address,float Enemy_X_Location_Address,float Enemy_Y_Location_Address,
                float Enemy_Z_Location_Address)
	    
            { My_X_Location,My_Y_Location,My_Z_Location,Enemy_X_Location,Enemy_Y_Location,Enemy_Z_Location } float Returns[12];
            
            
        Start:
		      mov ecx,esp
			  push [Get_If_Aiming_Address]
			  call ReadMemory
			  fldz
			  fld dword ptr [esp]
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  je end
			  push [My_X_Location_Address]
			  call ReadMemory
			  pop eax
			  push [My_Y_Location_Address]
			  call ReadMemory
			  pop edx
			  push [My_Z_Location_Address]
			  call ReadMemory
			  pop ebx
			  mov [My_X_Location],eax
			  mov [My_Y_Location],edx
			  mov [My_Z_Location],ebx
			  push [Enemy_X_Location_Address]
			  call ReadMemory
			  pop eax
			  push [Enemy_Y_Location_Address]
			  call ReadMemory
			  pop edx
			  push [Enemy_Z_Location_Address]
			  call ReadMemory
			  pop ebx
			  cmp eax,0
			  je Testz
			  jmp DontEnd
              
Tesz:
			  cmp edx,0
			  je T1
			  jmp DontEnd
T1:
			  cmp ebx,0
			  je end
DontEnd:
			  push [Enemy_X_Location_Address]
			  call ReadMemory
			  pop eax
			  push [Enemy_Y_Location_Address]
			  call ReadMemory
			  pop edx
			  push [Enemy_Z_Location_Address]
			  call ReadMemory
			  pop ebx
			  mov [Enemy_X_Location],eax
			  mov [Enemy_Y_Location],edx
			  mov [Enemy_Z_Location],ebx
			  fld dword ptr [Enemy_X_Location]
			  fld dword ptr [My_X_Location]
			  fsub
			  fstp dword ptr [My_X_Location]
			  fld dword ptr [Enemy_Y_Location]
			  fld dword ptr [My_Y_Location]
			  fsub
			  fstp dword ptr [My_Y_Location]
			  fld dword ptr [Enemy_Z_Location]
			  fld dword ptr [My_Z_Location]
			  fsub
			  fstp dword ptr [My_Z_Location]
			  fldz
			  fld dword ptr [My_Y_Location]
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  jb C1
			  jmp endC1

C1:
			  fldz
			  fld dword ptr [My_X_Location]
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  jb C1_1
			  jge C1_2
C1_1:
			  push -1
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fld dword ptr [My_X_Location]
			  fmul
			  fstp DWORD PTR [My_X_Location]
			  add esp,4
			  push -1
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fld dword ptr [My_Y_Location]
			  fmul
			  fstp DWORD PTR [My_Y_Location]
			  add esp,4
			  push 180
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  push 1
			  call Degrees_X
			  jmp endC2
C1_2:
			  push 1
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fld dword ptr [My_X_Location]
			  fmul
			  fstp DWORD PTR [My_X_Location]
			  add esp,4
			  push -1
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fld dword ptr [My_Y_Location]
			  fmul
			  fstp DWORD PTR [My_Y_Location]
			  add esp,4
			  push 90
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  push 0
			  call Degrees_X
			  jmp endC2
endC1:
			  fldz
			  fld dword ptr [My_Y_Location]
			  add esp,4
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  jge C2
			  jmp endC2
C2:
			  fldz
			  fld dword ptr [My_X_Location]
			  add esp,4
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  jb C2_1
			  jge C2_2
C2_1:
			  push -1
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fld dword ptr [My_X_Location]
			  fmul
			  fstp DWORD PTR [My_X_Location]
			  add esp,4
			  push 1
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fld dword ptr [My_Y_Location]
			  fmul
			  fstp DWORD PTR [My_Y_Location]
			  add esp,4
			  push 270
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  push 0
			  call Degrees_X
			  jmp endC2
C2_2:
			  push 1
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fld dword ptr [My_X_Location]
			  fmul
			  fstp DWORD PTR [My_X_Location]
			  add esp,4
			  push 1
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fld dword ptr [My_Y_Location]
			  fmul
			  fstp DWORD PTR [My_Y_Location]
			  add esp,4
			  push 0
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  push 1
			  call Degrees_X
			  jmp endC2
endC2:
			  push [Current_X_Degress_Address]
			  call ReadMemory
			  fldz
			  fld dword ptr [esp]
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  jb add360d
			  jmp dadd360d
add360d:
			  fld dword ptr [esp]
			  push 360
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld dword ptr [esp]
			  fadd
			  add esp,4
			  fstp DWORD PTR [esp]
dadd360d:
			  push [X_Degress_Address]
			  call ReadMemory
			  fld dword ptr [esp]
			  fld dword ptr [esp+4]
			  fsub
			  add esp,4
			  fstp dword ptr [esp]
			  fld dword ptr [esp]
			  fld dword ptr [esp+4]
			  fadd
			  add esp,4
			  fstp dword ptr [esp]
			  pop ebx
			  push [X_Degress_Address]
			  push ebx
			  call WriteMemory
			  fldz
			  fld dword ptr [My_Z_Location]
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  jb DoMinus
			  push -1
			  jmp elseDoPlus
DoMinus:
			  fld [My_Z_Location]
			  push -1
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fmul
			  fstp DWORD PTR [My_Z_Location]
			  push 1
elseDoPlus:
			  call Degrees_Y;
			  push [Current_Y_Degress_Address]
			  call ReadMemory
			  push [Y_Degress_Address]
			  call ReadMemory
			  fld dword ptr [esp]
			  fld dword ptr [esp+4]
			  fsub
			  add esp,4
			  fstp dword ptr [esp]
			  fld dword ptr [esp]
			  fld dword ptr [esp+4]
			  fadd
			  add esp,4
			  fstp dword ptr [esp]
			  pop eax
			  push [Y_Degress_Address]
			  push eax
			  call WriteMemory
			  push [Enemy_X_Location_Address]
			  push 0
			  call WriteMemory
			  push [Enemy_Y_Location_Address]
			  push 0
			  call WriteMemory
			  push [Enemy_Z_Location_Address]
			  push 0
			  call WriteMemory
			  jmp end
ReadMemory: ; ReadMemory(Address)
			  pop (Returns[0])
			  pop esi
			  mov edi, DWORD PTR DS:[esi]
              push edi
			  xor edi,edi
			  xor esi,esi
			  push (Returns[0])
			  retn
WriteMemory: ; WriteMemory(Address,Value)
			  pop (Returns[0])
			  pop esi
              pop edi
              mov DWORD PTR DS:[edi], esi
			  xor esi,esi
			  xor edi,edi
			  push (Returns[0])
			  retn
Sqrt: ; Sqrt(Value)
	          pop (Returns[0])
			  fld dword ptr [esp]
			  fsqrt
		      fstp dword ptr [esp]
			  push (Returns[0])
			  retn
Atan: ; Atan(Value)
	          pop (Returns[0])
			  fld dword ptr [esp]
	          fld1
	          fpatan
	          fstp dword ptr [esp]
              push 180
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld dword ptr [esp]
			  fldpi
			  fdiv
			  fstp dword ptr [esp]
			  pop esi
			  fld dword ptr [esp]
			  push esi
			  fld dword ptr [esp]
			  fmul
			  add esp,4
			  fstp dword ptr [esp]
			  push (Returns[0])
			  retn
Pow: ; Pow(Base,Power)
	          pop (Returns[0])
	          fld DWORD PTR [esp]
		      fld DWORD PTR [esp+4]
		      fld1
		      fsub
		      fyl2xp1
        	  sub     esp,16                               
		      fist    DWORD PTR [esp+12]        
	 	      fld1
		      fstp    TBYTE PTR [esp]
		      fisub   DWORD PTR [esp+12]           
		      mov     eax, [esp+12]
		      add     [esp+8],eax
		      f2xm1
		      fld1
		      fadd
		      fld     TBYTE PTR [esp] 
		      fmul                                 
		      add     esp,20
		      fstp DWORD PTR [esp]
			  push (Returns[0])
			  retn
Asin: ; Asin(Value)
		      pop (Returns[4])
		      push 2
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
		      call Pow
		      pop edi
		      push edi
		      fld1
	          fld DWORD PTR [esp]
		      fsub
		      fstp DWORD PTR [esp]
		      push edi
		      fld DWORD PTR [esp]
	          fld DWORD PTR [esp+4]
		      fdiv
		      fstp DWORD PTR [esp]
		      call Sqrt
			  call Atan
			  push (Returns[4])
		      retn
Acos: ; Acos(Value)
		      pop (Returns[4])
		      push 2
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
		      call Pow
		      pop edi
		      push edi
		      fld1
	          fld DWORD PTR [esp]
		      fsub
		      fstp DWORD PTR [esp]
		      push edi
		      fld DWORD PTR [esp+4]
	          fld DWORD PTR [esp]
		      fdiv
		      fstp DWORD PTR [esp]
		      call Sqrt
			  call Atan
			  push (Returns[4])
		      retn
Degrees_X: ; Degrees_X(Value,Value)
		      pop (Returns[8])
			  pop esi
			  pop [temp]
			  push [My_X_Location]
			  push 2
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  call Pow
			  push [My_Y_Location]
			  push 2
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  call Pow
			  fld DWORD PTR [esp+4]
			  fld DWORD PTR [esp]
			  fadd
			  add esp,4
			  fstp DWORD PTR [esp]
			  call Sqrt
			  push [My_X_Location]
			  fld DWORD PTR [esp]
			  fld DWORD PTR [esp+4]
			  fdiv
			  add esp,4
			  fstp DWORD PTR [esp]
			  pop edi
			  cmp esi,1
			  je DoSin_X
			  jmp DoCos_X
DoSin_X:
			  push edi
			  call Asin
			  fld DWORD PTR [temp]
			  fld DWORD PTR [esp]
			  fadd
			  add esp,4
			  fstp DWORD PTR [esp]
			  push (Returns[8])
			  retn
DoCos_X:
			  push edi
			  call Acos
			  fld DWORD PTR [temp]
			  fld DWORD PTR [esp]
			  fadd
			  add esp,4
			  fstp DWORD PTR [esp]
			  push (Returns[8])
			  retn
Degrees_Y: ; Degrees_Y()
		      pop (Returns[8])
			  pop [temp]
			  push [My_X_Location]
			  push 2
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  call Pow
			  push [My_Y_Location]
			  push 2
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  call Pow
			  fld DWORD PTR [esp+4]
			  fld DWORD PTR [esp]
			  fadd
			  add esp,4
			  fstp DWORD PTR [esp]
			  push [My_Z_Location]
			  push 2
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  call Pow
			  fld DWORD PTR [esp+4]
			  fld DWORD PTR [esp]
			  fadd
			  add esp,4
			  fstp DWORD PTR [esp]
			  call Sqrt
			  push [My_Z_Location]
			  fld DWORD PTR [esp]
			  fld DWORD PTR [esp+4]
			  fdiv
			  add esp,4
			  fstp DWORD PTR [esp]
			  call Asin
			  push temp
			  fild DWORD PTR [esp]
			  fstp DWORD PTR [esp]
			  fld DWORD PTR [esp]
			  fld DWORD PTR [esp+4]
			  fmul
			  add esp,4
			  fstp DWORD PTR [esp]
			  push (Returns[8])
			  retn
end:
			  mov esp,ecx
			}
			Sleep(17);
}
